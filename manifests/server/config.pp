# glusterfs::server::config.pp

define glusterfs::server::config(
	$datadir = '/data',
	$username = 'gluster',
	$password,
	$owner = root,
	$group = root
) {

	include glusterfs::server
	
	$datapath = "${datadir}/${name}"

	file { "${datadir}":
		ensure => directory,
		owner => $owner,
		group => $group,
	}
	
	file { "${datapath}":
		ensure => directory,
		owner => $owner,
		group => $group,
		require => File["${datadir}"],
	}
	
	file { "glusterfs_server_${name}":
		name => "/etc/glusterfs/glusterfsd.vol",
		owner => root,
		group => root,
		mode => 644,
		content => template("glusterfs/server.config.erb"),
		notify => Service["glusterfs-server"],
		require => [ Package["glusterfs-server"], File["${datapath}"] ],
	}

}
