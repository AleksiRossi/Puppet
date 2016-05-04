define apache::vhost ($port, $docroot) {
	file { '/etc/apache2/sites-available/site.conf':
                content => template('/etc/puppet/templates/site.conf.erb'),
                notify => Exec['ensite'],
        }
}
