#!/bin/bash

base_addr=0x30040000

count=0
env=$1

function get_reg() {
	echo $(printf "%x" $(($base_addr+$1)))
}

function write_reg() {
# $1 : reg
# $2 : val
	if [ "$env" = "tizen" ]; then
		sdb shell devmem2 $1 w $2
	elif [ "$env" = "tw" ]; then
		adb shell toolbox r $1 $2
	else
		adb shell lookat -s $2 $1
	fi
}

function read_reg() {
# $1 : reg
# $2 : len
	if [ "$env" = "tizen" ]; then
#		devmem2 $(get_reg $1)
		sdb shell devmem2 $(get_reg 0x44)
		sdb shell devmem2 $(get_reg 0x50)
	elif [ "$env" = "tw" ]; then
#		toolbox r $(get_reg $1)
		adb shell toolbox r $(get_reg 0x44)
		adb shell toolbox r $(get_reg 0x50)
	else
		adb shell lookat -l $2 $(get_reg $1)
	fi
}

function show_result() {
	read_reg 0x44 6
}

function write_busmon_reg() {
	write_reg $(get_reg $1) $2
}

# set busmon
echo "config bus mon $base_addr"
write_reg 0x30020000 0
write_busmon_reg 0x00 0x20000013
write_busmon_reg 0x04 0x00000000
write_busmon_reg 0x08 0x00000000
write_busmon_reg 0x0c 0xffffffff
write_busmon_reg 0x10 0x00000000
write_busmon_reg 0x14 0x00000000
write_busmon_reg 0x18 0x00000000
write_busmon_reg 0x1c 0x00000000
write_busmon_reg 0x20 0x00000000
write_busmon_reg 0x24 0x00000000
write_busmon_reg 0x28 0x00000000
write_busmon_reg 0x2c 0x00000000
write_busmon_reg 0x30 0x00000000

# show count data
echo "data before start"
show_result
echo "=================="

# start
write_busmon_reg 0x00 0x2000001b

# show count data for each second
while [ $count -lt 60 ];
do
	sleep 1
	show_result
	echo "---- $count"
	count=$(( $count + 1 ))
	write_busmon_reg 0x00 0x2000001b
done

# stop
write_busmon_reg 0x00 0x20000003
sleep 0.2

# show count data
echo "data after stop"
show_result
echo "=================="

