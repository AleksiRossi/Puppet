node default {
	class {'kissa':}
}

node slave1 {
	class {'apache':}
	class {'apache::site':}
}
