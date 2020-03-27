#!/bin/bash -x

yum install -y aws-cfn-bootstrap git mc

echo "=======Configure Additional EBS volume for Jenkins snapshot======="
mkfs.ext4 /dev/sdf

echo "=========Install Jenkins stable release==========="
yum remove -y java
yum install -y java-1.8.0-openjdk
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
cp -pRv /var/lib/jenkins /mnt
mount /dev/xvdf /mnt/jenkins
chown jenkins:jenkins /mnt/jenkins
sed -i "s#/var/lib/jenkins#/mnt/jenkins#" /etc/sysconfig/jenkins
service jenkins start
chkconfig jenkins on
