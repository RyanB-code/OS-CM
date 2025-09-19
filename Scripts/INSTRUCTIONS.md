# Instructions

This will create a symlink to make `~/Scripts` directory.

```
cd ~
ln -s path/to/OS-CM/Scripts/ .
```

# Open-Dev-Env Configuration

The file labeled `open-dev-env.cfg" is where to configure the script of the same name.

```
CONNECT_TO_NAS=false              # If set to 'true', it will attempt to find the
                                  # mount point at the next variable in a loop
NAS_MOUNT_POINT=NULL              # If the above variable is 'false' the content of this does not matter
WORKING_DIR=path/to/desired/dir   # Path to open NVIM and a blank terminal to work in
```
