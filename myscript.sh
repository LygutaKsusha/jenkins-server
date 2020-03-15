#!bin/bash
sudo yum install -y wget java-1.8.0-openjdk java-1.8.0-openjdk-devel net-tools git aws-cfn-bootstrap
sudo rpm -ivh https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
sudo rpm --import https://jenkins-ci.org/redhat/jenkins-ci.org.key
sudo mkdir -p /home/jenkins /var/lib/jenkins/.ssh /var/cache/jenkins/war /var/log/jenkins
sudo yum install -y jenkins
sudo systemctl enable jenkins.service
sudo systemctl start jenkins.service
