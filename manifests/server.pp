# server.pp

class glusterfs::server inherits glusterfs::client {

	apt::force { "glusterfs-server":
		release => "unstable",
		version => $verion,
		require => Apt::Source["${apt_source}"],
	}
	
	service { "glusterfs-server":
		enable => true,
		ensure => running,
		hasrestart => true,
		hasstatus => true,
	}

}
