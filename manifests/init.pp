# glusterfs.pp

class glusterfs::common {
	
	package { "libibverbs1":
		ensure => installed
	}
	
	package { "libglusterfs0":
		ensure => installed
	}

}

