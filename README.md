### Preconditions

* CentOS 7

* Install JDK 
> https://github.com/IntershopCommunicationsAG/setup_oracle_jdk17

* Install VCS
> https://github.com/IntershopCommunicationsAG/setup_vcs_client
    
* Create Sources From Intershop Templates (https://support.intershop.com/kb/index.php/Display/L26224, Cookbook - Setup CI Infrastructure)
> https://github.com/IntershopCommunicationsAG/ci-setup

* Intershop 7 developer license

### Installation and configuration automatically

* Install Jenkins

> <code>./jenkins_install.sh</code>

* Configure Jenkins automatically

> <code>./jenkins_configure.sh</code>
    
### Final configuration manually

* Add global password for your Nexus account: <code>http://JENKINS_IP:8080/configure</code>
    
> Select Global Passwords | Add.

> Name: "DEPLOY_USER_PASSWORD"

> Password: e.g., "admin123"
    
* Configure your email notification settings: <code>http://JENKINS_IP:8080/configure</code>

* Configure the preferred Subversion version: <code>http://JENKINS_IP:8080/configure</code>

* Configure your jobs: <code>http://JENKINS_IP:8080/job/JOB_NAME/configure</code>

> Adapt the project specific settings (e.g. Component set and assembly names and versions).
    
> Adapt the VCS URL's (e.g. SVN repository URL's and credentials)
    
* Intershop 7 license: Copy your developer license key to the configured path location.