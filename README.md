This is a modified version of Millhouse's original script here:
http://forums.freenas.org/index.php?threads/unsure-of-sata-drive-spindown.1053/page-4#post-29123

My modifications were made to better support SMART. Namely:
* If a SMART test runs that causes the disks to spin up, this will be detected and the idle timer will be reset. Previously, if the disks were spun down and awoken by a SMART test, the script wouldn't know about this and wouldn't spin the disks back down.
* If a SMART test is in progress, we won't try to spin the disks down.
* Use smartctl -s standby,now to spin the disks down instead of camcontrol stop. A benefit of this is that we can use the smartctl "-n standby" flag, so that if the disk already happens to be spun down, we don't wake it up in order to spin it down again.

NOTE:
millhouse.sh is the actual script

millhouse_daemon.sh is mostly for my own purposes, but you may find it useful too. I add this as a post-init launch script on my freenas server. Its purpose is to wait for a pool to become available, then execute millhouse.sh. This is useful if you have a geli encrypted pool and you want millhouse to kick in as soon as you enter your password.

