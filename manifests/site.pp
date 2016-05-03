node default {
	class {'kissa':}
	class {'apache':
                port => '80',
                docroot => '/home/aleksi/website'
        }
}
