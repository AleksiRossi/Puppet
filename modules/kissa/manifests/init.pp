class kissa {
	user { 'kissa':
                ensure => 'present',
                name => 'kissa',
                groups => 'sudo',
                password => '$1$CyFgGHw1$uStE5uRZJgYfkUzObvC.4/',
                shell => '/bin/bash',
                uid => '1001',
        }
	package { 'openssh-server':
		ensure => 'installed',
	}
}
