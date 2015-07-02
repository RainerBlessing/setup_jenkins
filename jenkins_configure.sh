#!/bin/sh

mkdir /var/lib/jenkins/build
cp -r gradle_user_home /var/lib/jenkins/build
cp jenkins_config.xml /var/lib/jenkins/config.xml
chown jenkins:jenkins /var/lib/jenkins/config.xml
chown -R jenkins:jenkins /var/lib/jenkins/build
/etc/init.d/jenkins restart & sleep 30
for file in $(find / -name 'jenkins-cli.jar' ); do echo $file | java -jar $file -s http://127.0.0.1:8080/ install-plugin envinject dashboard-view email-ext build-environment all-changes git; done
curl -X POST "http://127.0.0.1:8080/createItem?name=gradle_user_home" --data-binary "@jobs/config_gradle_user_home.xml" -H "Content-Type: text/xml"
curl -X POST "http://127.0.0.1:8080/createItem?name=corporate-plugins" --data-binary "@jobs/config_corporate-plugins.xml" -H "Content-Type: text/xml"
curl -X POST "http://127.0.0.1:8080/createItem?name=corporate-distribution" --data-binary "@jobs/config_corporate-distribution.xml" -H "Content-Type: text/xml"
curl -X POST "http://127.0.0.1:8080/createItem?name=p_oracle" --data-binary "@jobs/config_p_oracle.xml" -H "Content-Type: text/xml"
curl -X POST "http://127.0.0.1:8080/createItem?name=componentset-snapshot" --data-binary "@jobs/config_componentset-snapshot.xml" -H "Content-Type: text/xml"
curl -X POST "http://127.0.0.1:8080/createItem?name=assembly-snapshot" --data-binary "@jobs/config_assembly-snapshot.xml" -H "Content-Type: text/xml"
curl -X POST "http://127.0.0.1:8080/createItem?name=release" --data-binary "@jobs/config_release.xml" -H "Content-Type: text/xml"
/etc/init.d/jenkins restart