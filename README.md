# Welcome to Puppet project

This is a repository for my puppet modules I am working on for a school course at Haaga-Helia

## Modules

Netdata and vcsrepo modules added.

Vcsrepo module - allows puppet to use git for cloning or pushing purposes.

Netdata module - my first own Puppet module. It has 2 manifests. First one is install.pp, it will install required dependancies. Second module, init.pp will clone the Netdata repository under /opt/netdata_installer. 

Apachde module - Installs Apache, removes default site and add new document root at home folder

Foreman module - Adds package for Foreman and install the installer

Kissa module - Creates new user Kissa with a set password

SSH module - Install openssh-server and configures it to allow only Kissa user
 
UFW module - Enables UFW, enforces default settings and allows all ssh connections.

Icinga module - Adds Icinga2 client and configures it for remote monitoring with master server.

## Sources

http://terokarvinen.com/2016/aikataulu-%E2%80%93-linuxin-keskitetty-hallinta-ict4tn011-9-loppukevat-2016
http://terokarvinen.com/2013/ssh-server-puppet-module-for-ubuntu-12-04
http://www.puppetcookbook.com/
https://docs.puppet.com/puppet/latest/reference/lang_defined_types.html
http://theforeman.org/manuals/1.1/index.html
http://serverfault.com/questions/647805/how-to-set-up-icinga2-remote-client-without-using-cli-wizard
http://docs.icinga.org/icinga2/latest/doc/module/icinga2/chapter/icinga2-client

