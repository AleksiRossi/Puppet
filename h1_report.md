# First Homework

I wanted to test how to install this new metrics software Netdata I found with Puppet. 

Installation of the software had 3 steps: 
1. Install dependencies via apt-get
2. Clone the Netdata github repository
3. Run installer

I decided to first install the dependencies, which seemed the easiest step. First I had a few syntax errors and then problem with allowcdrom parameter, which needed to be set 'true', I managed to get all the packages installed pretty easily.

For the next manifest, I needed to clone the repository with git. I was a bit surprised Puppet could not do that automatically, but with a quick google check, there was a ready Puppet endorsed module 'vcsrepo' that solved my problem. Puppet even had a ready install command:

puppet module install puppetlabs-vcsrepo

After installing the module, I could easily create a manifest to clone the repository.

Lastly, I needed to run the downloaded installer script. I think running the script would not have been hard, but you also need to enter few parameters during the installation. Because of this, I decided to skip running the script via Puppet and do it manually. 

Overall this module does not save awfully much time, considering you can install Netdata manually in about 5 minutes. However, now the process is managed and even more simple. All you need is to apply the 2 manifests (could link them together at some point) and run the installer. After that, simply enter http://localhost:19999 to browser and watch your computer metrics in a fancy dashboard.

Vcsrepo module allows puppet to use git for cloning or pushing purposes.

Netdata module is my first own Puppet module. It has 2 manifests. First one is install.pp, it will install required dependancies. Second module, init.pp will clone the Netdata repository under /opt/netdata_installer. 

You can run these modules with following commands:

puppet apply --modulepath modules/ -e 'class {"netdata::install":}'

puppet apply --modulepath modules/ -e 'class {"netdata":}'

Afterwards run the installer  /opt/netdata_installer/netdata-installer.sh and open your browser at
http://localhost:19999
