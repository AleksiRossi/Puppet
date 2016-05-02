node default {
	class {'kissa':}
	class {'apache':}
	class {'apache::site':}
	class {'ssh':}
}
