#!/bin/sh

#run script as root

#Oracle 11g Express Edition requires additional software that is not installed by default:
apt-get install alien libaio1 unixodbc

#make swapfile
dd if=/dev/zero of=/export/swapfile bs=1024 count=2097152
mkswap /export/swapfile
swapon /export/swapfile
swapon -a

#modify fstab
cp /etc/fstab /etc/fstab.backup_`date +%N`
echo '/export/swapfile swap swap defaults 0 0' >> /etc/fstab

#modify kernel parameters
cat > /etc/sysctl.d/60-oracle.conf <<-EOF
# Oracle 11g XE kernel parameters
fs.file-max=6815744
net.ipv4.ip_local_port_range=9000 65500
kernel.sem=250 32000 100 128
# kernel.shmmax=429496729
kernel.shmmax=107374183
EOF

#Load and verify the new kernel parameters
service procps start
sysctl -q fs.file-max
sysctl -q kernel.shmmax
sysctl -q net.ipv4.ip_local_port_range
sysctl -q kernel.sem

#ORA-00845: MEMORY_TARGET
#Oracle 11gR2 XE under Ubuntu 11.10 will result in 
#"ORA-00845: MEMORY_TARGET not support on this system" either at 
#Oracle database startup or during the initial installation. 
#Ubuntu 11.10 uses a new version of the "systemd" system and session
#manager and has migrated away from /dev/shm and other common
#directories in favor of /run.
#There are several ways how to address the problem. You can either
#enable /dev/shm shared memory, or change the default memory management 
#of Oracle 11g from AMM (Automatic Memory Management) to 
#ASMM (Automatic Shared Memory Management) as it was in used the 
#previous 10g version. Since AMM is one of the new features of 11g, the 
#following will show you how to make to make AMM work.

cat > /etc/init.d/oracle-shm <<-EOF
#! /bin/sh
# /etc/init.d/oracle-shm
#
#
case "\$1" in
  start)
    echo "Starting script /etc/init.d/oracle-shm"
    # Run only once at system startup
    if [ -e /dev/shm/.oracle-shm ]; then
      echo "/dev/shm is already mounted, nothing to do"
    else
      rm -f /dev/shm
      mkdir /dev/shm
      mount --move /run/shm /dev/shm
	  mount -B /dev/shm /run/shm
      #mount -B /run/shm /dev/shm
      touch /dev/shm/.oracle-shm
    fi
    ;;
  stop)
    echo "Stopping script /etc/init.d/oracle-shm"
    echo "Nothing to do"
    ;;
  *)
    echo "Usage: /etc/init.d/oracle-shm {start|stop}"
    exit 1
    ;;
esac
#
### BEGIN INIT INFO
# Provides:          oracle-shm
# Required-Start:    $remote_fs $syslog
# Required-Stop:     $remote_fs $syslog
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6 
# Short-Description: Bind /run/shm to /dev/shm at system startup.
# Description:       Fix to allow Oracle 11g use AMM.
### END INIT INFO
EOF

#Install the oracle-shm init script:
chmod 755 /etc/init.d/oracle-shm
update-rc.d oracle-shm defaults 01 99

#install hack for chkconfig
cat > /sbin/chkconfig <<-EOF
#!/bin/bash
# Oracle 11gR2 XE installer chkconfig hack for Debian based Linux (by dude)
# Only run once.
echo "Simulating /sbin/chkconfig..."
if [[ ! \`tail -n1 /etc/init.d/oracle-xe | grep INIT\` ]]; then
cat >> /etc/init.d/oracle-xe <<-EOM
#
### BEGIN INIT INFO
# Provides:                  OracleXE
# Required-Start:        \\\$remote_fs \\\$syslog
# Required-Stop:        \\\$remote_fs \\\$syslog
# Default-Start:            2 3 4 5
# Default-Stop:            0 1 6
# Short-Description:   Oracle 11g Express Edition
### END INIT INFO
EOM
fi
update-rc.d oracle-xe defaults 80 01
EOF

chmod 755 /sbin/chkconfig

ln -s /usr/bin/awk /bin/awk
mkdir /var/lock/subsys
