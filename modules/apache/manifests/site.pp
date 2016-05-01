class apache::site {
	file { '/var/www/html/index.html':
		ensure => 'absent',
<<<<<<< HEAD
		notify => Exec['dissite'],
	}
	exec { 'dissite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2dissite 000-default.conif',
		refreshonly => true,
=======
	}
	exec { 'dissite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2dissite 000-default.conf'
>>>>>>> 61640b3db74db3d5d356f76a24f158e5811aad1f
	}
	file { '/home/aleksi/website':
		ensure => 'directory',
		owner => 'aleksi',
		group => 'www-data',
		mode => '0775',
	}	
 	file { '/etc/apache2/sites-available/site.conf':
		content => template('/etc/puppet/templates/site.conf.erb'),
<<<<<<< HEAD
		notify => Exec['ensite'],
=======
>>>>>>> 61640b3db74db3d5d356f76a24f158e5811aad1f
	}
	exec { 'ensite':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'a2ensite site.conf',
<<<<<<< HEAD
		refreshonly => true,
		notify => Service['apache2'],
	}
	file { '/home/aleksi/website/index.html':
		content => 'Hello!',
	}
	service { 'apache2':
		ensure => 'running',
		enable => true
=======
	}
	file { '/home/aleksi/website/index.html':
		content => 'Hello!',
>>>>>>> 61640b3db74db3d5d356f76a24f158e5811aad1f
	}	
}
