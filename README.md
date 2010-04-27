# GlusterFS modules for Puppet

## Description
This module will help manage both GlusterFS servers and clients.

## Usage
Below is a sample class that would setup a GlusterFS server and client.

<pre>
class glusterhost {
    $username = 'username'
    $password = 'password'

    glusterfs::server::config { gluster:
        username => $username,
        password => $password
    }
    
    glusterfs::client::config { gluster:
        servers => [ "server1", "server2", "server3" ],
        username => $username,
        password => $password
    }
}
</pre>

It will will the latest versions of GlusterFS from the Debian Unstable repository, along with create the required server and client configs.  It will also create an fstab entry for the client mount.  See `manifests/server/config.pp` and `manifests/client/config.pp` for the options you can configure.
