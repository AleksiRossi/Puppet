class ufw {
	service { 'ufw':
		ensure => running,
		enable => true,
	}	
	exec { 'ufw-deny':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'ufw default deny',
		unless => 'sudo ufw status verbose | grep "Default: deny (incoming), allow (outgoing)"',
	}
	exec { 'ufw-enable':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'yes | ufw enable',
		unless => 'ufw status | grep "Status: active"',
	}
	exec { 'ufw-ssh':
		path => [ '/bin', '/usr/bin', '/usr/sbin' ],
		command => 'ufw allow 22',
		unless => 'ufw status | grep "22 * ALLOW"',		
	}
}
