# CentOS6 to CentOS7 Upgrade
As [Centos upgrade tool is no longer available](https://wiki.centos.org/TipsAndTricks/CentOSUpgradeTool).  With this script, You can easily upgrade CentOS6 to CentOS7

It has the latest repos till 04 2020.

### Backup Your Data
The most important step before performing any update or upgrade is to take a backup of all data. if you have the VM please take snapshot.

### Upgrade Procedure
```./centosupgradescript.sh ```
Above command will take some time and on successfull these will be last few lines
>No upgrade available for the following repos: base elasticsearch epel extras updates
>getting boot images...
>setting up update...
>testing upgrade transaction
>setting up system for upgrade
>Finished. Reboot to start upgrade.

After that you have to run the reboot command.