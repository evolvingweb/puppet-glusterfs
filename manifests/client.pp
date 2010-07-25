# client.pp

class glusterfs::client inherits glusterfs::common {
	
	package { "glusterfs-client":
	  ensure => installed
	}

}
