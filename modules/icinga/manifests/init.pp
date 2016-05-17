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
		require => Package['icinga2'],
	}
	file {'/etc/icinga2/conf.d/commands/commands.conf':
		content => template('icinga/commands.erb'),
		require => Package['icinga2'],
	}
	file {'/usr/lib/nagios/plugins/check_memory':
		content => template('icinga/check_memory.erb'),
		mode => '0755',
		require => Package['nagios-plugins'],
	}
	file {'/etc/icinga2/pki':
		ensure => 'directory',
		owner => 'nagios',
		require => Package['icinga2'],
	}
	icinga::setup {'slave':
		master => 'icinga-server',
		ticket => '83e6f0a7e680c59754a61e7592ae1fc618ef2e19',
		require => Package['icinga2'],
		notify => File['/etc/icinga2/features-enabled/api.conf'],
	}
	file {'/etc/icinga2/features-enabled/api.conf':
		content => template('icinga/api.erb'),
	}	
}
