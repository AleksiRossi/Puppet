class apache::site {
	file { '/var/www/html/index.html':
		ensure => 'absent',
		notify => Exec['dissite'],
	}
	exec { 'dissite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2dissite 000-default.conif',
		refreshonly => true,
	}
	file { '/home/aleksi/website':
		ensure => 'directory',
		owner => 'aleksi',
		group => 'www-data',
		mode => '0775',
	}	
 	file { '/etc/apache2/sites-available/site.conf':
		content => template('/etc/puppet/templates/site.conf.erb'),
		notify => Exec['ensite'],
	}
	exec { 'ensite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2ensite site.conf',
		refreshonly => true,
		notify => Service['apache2'],
	}
	file { '/home/aleksi/website/index.html':
		content => 'Hello!',
	}
	service { 'apache2':
		ensure => 'running',
		enable => true
	}
	file { '/home/aleksi/website/index.html':
		content => 'Hello!',
	}	
}
