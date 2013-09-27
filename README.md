NFS Cookbook
============
This cookbook installs the nfs client and provides a resource to create
and mount an nfs share.

Requirements
------------
Currently only supports Ubuntu 12.04 but should be very easy to port.

#### packages
- `nfs-client` - nfs needs toaster to brown your bagel.

nfs_media LWRP
--------------
This resource creates a directory and mounts a specified nfs share to it.
Why use this instead of just regular old mount?  This resource creates the
directory needed for the mount and will unmount any existing shares from
that directory.

#### actions

- `setup` - sets up a directory to mount to and mounts nfs
- `destroy` - removes both the nfs mount and the directory

#### attributes

- `nfs_share` - the nfs share to mount
- `local_directory` - the local directory to mount the nfs share to
- `options` - this is passed directly to the mount resource

Usage
-----
#### nfs::default
The default recipe installs nfs-client

```json
{
  "name":"my_node",
  "run_list": [
    "recipe[nfs]"
  ]
}
```

Contributing
------------
1. Fork the repository on Github
2. Create a named feature branch (like `add_component_x`)
3. Write you change
4. Write tests for your change (if applicable)
5. Run the tests, ensuring they all pass
6. Submit a Pull Request using Github

License and Authors
-------------------
Jim Rosser: jarosser06@gmail.com
