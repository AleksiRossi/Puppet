class icinga {
	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }

	exec { 'add_repo':
		command => 'add-apt-repository -y ppa:formorer/icinga',
		unless => 'cat /etc/apt/sources.list /etc/apt/sources.list.d/* | grep icinga',
		notify => Exec['update'],
	}	
	exec { 'update':
		command => 'apt-get update',
		refreshonly => true,
	}
	package { 'icinga2':
		ensure => 'installed',
	}
	package { 'nagios-plugins':
                ensure => 'installed',
        }
	file {'/etc/icinga2/conf.d/commands':
		ensure => 'directory',
	}
	file {'/etc/icinga2/conf.d/commands/commands.conf':
		content => template('icinga/commands.erb'),
	}
	file {'/usr/lib/nagios/plugins/check_memory':
		content => template('icinga/check_memory.erb'),
		mode => '0755',
	}
	file {'/etc/icinga2/pki':
		ensure => 'directory',
		owner => 'nagios'
	}
	icinga::setup {'puppet.local':
		master => 'icinga-server',
		ticket => 'd19b78cd63278d8be236988f44ca43cf2cf12542',
	}	
}
