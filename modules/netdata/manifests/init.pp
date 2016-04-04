class netdata {
	vcsrepo { '/opt/netdata_installer':
		ensure => present,
		provider => git,
		source => 'https://github.com/firehol/netdata.git',
	}
}
