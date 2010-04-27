# glusterfs.pp

class glusterfs::common {

	# need debian unstable repository for latest version
	include apt::debian::unstable
	$apt_source = "debian_unstable"
	$verion = "3.0.3"
	
	apt::force { libibverbs1:
		release => "unstable",
		version => "1.1",
		require => Apt::Source["${apt_source}"],
	}
	
	apt::force { libglusterfs0:
		release => "unstable",
		version => $verion,
		require => Apt::Source["${apt_source}"],
	}

}

