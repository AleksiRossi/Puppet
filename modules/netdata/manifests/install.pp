class netdata::install {
	Package { ensure => 'installed',
	allowcdrom => 'true' }
	package { 'zlib1g-dev': }
	package { 'gcc': }
	package { 'make': }
	package { 'autoconf': }
	package { 'autogen': }
	package { 'automake': }
	package { 'pkg-config': }
}
