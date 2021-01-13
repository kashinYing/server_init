# server_initialization
scripts to customize new server

## trojan
```
# check log
journalctl -f -u trojan
```

## yum
```
# show all repos
yum repolist all

# enable repos
yum-config-manager --enable rhui-rhel-7-server-rhui-extras-rpms
yum-config-manager --enable rhui-rhel-7-server-rhui-optional-rpms
yum-config-manager --enable rhui-rhel-7-server-rhui-rh-common-rpms
yum-config-manager --enable rhui-rhel-7-server-rhui-rpms
yum-config-manager --enable rhui-rhel-7-server-rhui-supplementary-rpms
yum-config-manager --enable rhui-rhel-server-rhui-rhscl-7-rpms
```
