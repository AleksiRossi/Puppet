class kissa {
	user { 'kissa':
                ensure => 'present',
                name => 'kissa',
                groups => 'sudo',
                password => '$1$14JS1V4P$WoIWjG.QsbZDhiVTN3f9A/',
                shell => '/bin/bash',
                uid => '1001',
        }
	package { 'openssh-server':
		ensure => 'installed',
	}
}
