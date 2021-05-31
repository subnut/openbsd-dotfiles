# On the source machine
(i.e. The machine that already has the packages installed)

```
pkg_info -mz > install_packages
```

# On the target machine
(i.e. The machine where the packages are to be installed)

```
pkg_add -l install_packages
```
