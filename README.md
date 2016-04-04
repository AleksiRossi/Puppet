# Welcome to Puppet project

This is a repository for my puppet modules I am working on for a school course at Haaga-Helia

## Modules

Netdata and vcsrepo modules added.

Vcsrepo module allows puppet to use git for cloning or pushing purposes.

Netdata module is my first own Puppet module. It has 2 manifests. First one is install.pp, it will install required dependancies. Second module, init.pp will clone the Netdata repository under /opt/netdata_installer. 

You can run these modules with following commands:

puppet apply --modulepath modules/ -e 'class {"netdata::install":}'

puppet apply --modulepath modules/ -e 'class {"netdata":}'
