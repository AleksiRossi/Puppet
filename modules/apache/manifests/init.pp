class apache ($port, $docroot) {
	apache::vhost { 'website': 
		port => $port,
		docroot => $docroot,
	}
}

