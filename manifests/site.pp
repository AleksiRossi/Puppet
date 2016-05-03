node default {
	class {'kissa':}
<<<<<<< HEAD
	class {'apache':
                port => '80',
                docroot => '/home/aleksi/website'
        }
=======
	class {'apache':}
	class {'apache::site':}
	class {'ssh':}
>>>>>>> 9038d6e78c470ae5f1a0882626a9a7ecc290ad73
}
