#!/bin/sh
# 512MB
echo 536870912 > /sys/block/zram0/disksize
/system/bin/mkswap /dev/block/zram0
/system/bin/swapon /dev/block/zram0

# default:60 higher value means doing swapping more aggressively (0~100)
echo 100 > /proc/sys/vm/swappiness
