class foreman {
	package { 'ca-certificates':
		ensure => 'installed',
	}
	exec { 'getpuppet':
		path => [ '/usr/bin' ],
		command => 'wget -P /opt/ https://apt.puppetlabs.com/puppetlabs-release-trusty.deb',
		creates => '/opt/puppetlabs-release-trusty.deb',
	}
	exec { 'installpuppet':
		path => [ '/usr/bin', '/bin' ],
		command => 'dpkg -i /opt/puppetlabs-release-trusty.deb',
		unless => 'dpkg --get-selections | grep puppetlabs-release',
	}
	exec { 'addforeman':
		path => [ '/bin' ],
		command => 'echo "deb http://deb.theforeman.org/ trusty 1.11" > /etc/apt/sources.list.d/foreman.list',
		creates => '/etc/apt/sources.list.d/foreman.list',
	}
	exec { 'addplugins':
                path => [ '/bin' ],
                command => 'echo "deb http://deb.theforeman.org/ plugins 1.11" >> /etc/apt/sources.list.d/foreman.list',
                unless => 'cat /etc/apt/sources.list.d/foreman.list | grep plugins',
        }
	exec { 'addforemankey':
		path => [ '/usr/bin', '/bin/' ],
		command => 'sudo wget -qP /opt/ http://deb.theforeman.org/pubkey.gpg | sudo apt-key add /opt/pubkey.gpg',
		unless => 'apt-key list | grep foreman',
	}
	exec { 'update':
		command => '/usr/bin/apt-get update',
	}
	package { 'foreman-installer':
		ensure => 'installed',
	}
}
