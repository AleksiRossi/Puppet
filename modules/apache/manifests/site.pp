class apache::site {
	file { '/var/www/html/index.html':
		ensure => 'absent',
	}
	exec { 'dissite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2dissite 000-default.conf'
	}
	file { '/home/aleksi/website':
		ensure => 'directory',
		owner => 'aleksi',
		group => 'www-data',
		mode => '0775',
	}	
 	file { '/etc/apache2/sites-available/site.conf':
		content => template('/etc/puppet/templates/site.conf.erb'),
	}
	exec { 'ensite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2ensite site.conf',
	}
	file { '/home/aleksi/website/index.html':
		content => 'Hello!',
	}	
}
