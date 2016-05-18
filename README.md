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

