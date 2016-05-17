define icinga::setup ($fqdn = $title, $master, $ticket) {
	Exec { path => [ '/bin/', '/sbin/' , '/usr/bin/', '/usr/sbin/' ] }
	exec { 'new_cert':
		command => "icinga2 pki new-cert --cn ${fqdn} --key /etc/icinga2/pki/$fqdn.key --cert /etc/icinga2/pki/$fqdn.crt",
		creates => "/etc/icinga2/pki/${fqdn}.key",
	}
	exec { 'save_cert':
		command => "icinga2 pki save-cert --key /etc/icinga2/pki/${fqdn}.key --cert /etc/icinga2/${fqdn}.crt --trustedcert /etc/icinga2/pki/trusted-master.crt --host ${master}",
		creates => "/etc/icinga2/pki/trusted-master.crt",
		require => Exec['new_cert'],
	}
	exec { 'request':
		command => "icinga2 pki request --host ${master} --port 5665 --ticket $ticket --key /etc/icinga2/pki/${fqdn}.key --cert /etc/icinga2/pki/${fqdn}.crt --trustedcert /etc/icinga2/pki/trusted-master.crt --ca /etc/icinga2/pki/ca.key",
		creates => "/etc/icinga2/pki/ca.crt",
		require => Exec['save_cert'],
	}
	exec { 'setup':
		command => "icinga2 node setup --ticket ${ticket} --endpoint ${master} --zone ${fqdn} --master_host ${master} --trustedcert /etc/icinga2/pki/trusted-master.crt",
	}
} 
