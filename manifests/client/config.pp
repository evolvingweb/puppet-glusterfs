# glusterfs::client::config.pp

define glusterfs::client::config(
	$servers = [],
	$mountdir = '/gluster',
	$username = 'gluster',
	$password,
	$owner = "root",
	$group = "root"
) {

	include glusterfs::client
	
	$mountpath = "${mountdir}/${name}"

	file { "${mountdir}":
		ensure => directory,
		owner => root,
		group => root,
	}
	
	exec { "umount ${mountpath}":
		unless => "ls ${mountdir}",
		notify => Mount["${mountpath}"],
	}
	
	file { "${mountpath}":
		ensure => directory,
		owner => $owner,
		group => $group,
		require => [ File["${mountdir}"], Exec["umount ${mountpath}"] ],
	}
	
	$conffile = "/etc/glusterfs/glusterfs.${name}.vol"
	
	file { "${conffile}":
		owner => root,
		group => root,
		mode => 644,
		content => template("glusterfs/client.config.erb"),
		notify => Mount["${mountpath}"],
		require => Package["glusterfs-client"],
	}
	
	mount { "${mountpath}":
		atboot => true,
		device => $conffile,
		ensure => mounted,
		fstype => "glusterfs",
		options => "noatime",
		require => [ File["${conffile}"], File["${mountpath}"] ],
		remounts => false,
	}

}
