#!/bin/bash

# Start
yum -y update

# JDK1.8
cd /opt/
wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.rpm" -O jdk-8u45-linux-x64.rpm
yum -y --nogpgcheck localinstall jdk-8u45-linux-x64.rpm
echo "export JAVA_HOME=/usr/java/default" > /etc/profile.d/jdk.sh
source /etc/profile.d/jdk.sh

# CDH5
cd /opt/
wget http://archive.cloudera.com/cdh5/one-click-install/redhat/6/x86_64/cloudera-cdh-5-0.x86_64.rpm
yum -y --nogpgcheck localinstall cloudera-cdh-5-0.x86_64.rpm
rpm --import http://archive.cloudera.com/cdh5/redhat/6/x86_64/cdh/RPM-GPG-KEY-cloudera
yum -y install hadoop-conf-pseudo

# Hadoop conf
sed -i "s/localhost/hadoop.pseudo.distributed/g" /etc/hadoop/conf/core-site.xml
sed -i "s/localhost/hadoop.pseudo.distributed/g" /etc/hadoop/conf/mapred-site.xml

# Format the Namenode
sudo -u hdfs hdfs namenode -format

# Start HDFS
for service in `cd /etc/init.d ; ls hadoop-hdfs-*`
do
  service $service start
done

# Create directories
/usr/lib/hadoop/libexec/init-hdfs.sh

# Start YARN
service hadoop-yarn-resourcemanager start
service hadoop-yarn-nodemanager start
service hadoop-mapreduce-historyserver start

# Create hdfs directorie
sudo -u hdfs hadoop fs -mkdir /user/hdfs

# Cleanup
rm -f /opt/jdk-8u45-linux-x64.rpm
rm -f /opt/cloudera-cdh-5-0.x86_64.rpm
yum clean all
