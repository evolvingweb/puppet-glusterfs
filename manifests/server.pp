# server.pp

class glusterfs::server inherits glusterfs::client {

	package { "glusterfs-server":
		ensure => installed
	}
	
	service { "glusterfs-server":
		enable => true,
		ensure => running,
		hasrestart => true,
		hasstatus => true,
		require => Package["glusterfs-server"]
	}

}
