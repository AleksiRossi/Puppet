class ssh {
	package { 'openssh-server':
		ensure => 'installed',
	}
	file { '/etc/ssh/sshd_config':
		content => template('/etc/puppet/templates/ssh.erb'),
		notify => Service['ssh'],
	}
	service { 'ssh':
		ensure => 'running',
		enable => 'true',
	}
}
