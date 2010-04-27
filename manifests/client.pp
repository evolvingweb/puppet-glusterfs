# client.pp

class glusterfs::client inherits glusterfs::common {
	
	apt::force { "glusterfs-client":
		release => "unstable",
		version => $verion,
		require => Apt::Source["${apt_source}"],
	}

}
