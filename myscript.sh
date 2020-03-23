#!/bin/bash -x

yum install -y aws-cfn-bootstrap git


echo "=========Install Jenkins stable release==========="
yum remove -y java
yum install -y java-1.8.0-openjdk
wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat-stable/jenkins.repo
rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
yum install -y jenkins
service jenkins start
chkconfig jenkins on

echo "=======Configure Additional EBS volume for Jenkins snapshot======="
mkdir /jenkins_home
echo -e "o\nn\np\n1\n\n\nw" | sudo fdisk /dev/sdf
sleep 3
sudo mkfs.ext4 /dev/sdf1
e2label /dev/sdf1 JENKINS
echo -e "LABEL=JENKINS     /jenkins_home    ext4   defaults 0 0" >> /etc/fstab
mount -a
ln -s /var/lib/jenkins /jenkins_home
