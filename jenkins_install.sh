#!/bin/sh

wget --no-check-certificate -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo
rpm --import http://pkg.jenkins-ci.org/redhat/jenkins-ci.org.key
yum -y install jenkins
yum -y install java-1.8.0-openjdk
/etc/init.d/jenkins start