#!/usr/bin/perl

# if ($#ARGV < 1 ) {
# 	die "param wrong!\n File should be dump_txt.mem and vmlinux_txt.mem";
# }

$bootimg=$ARGV[0]; #"/home/likewise-open/SPREADTRUM/hua.fang/net_folder/to_internal_folder/Platform/hua.fang/dump41/dump.txt";

open(FP1, $bootimg) || die "cannot open file $!";
binmode(FP1);

my $buffer;
my $magic;							# 8
my $kernel_size, $kernel_addr;		# 4
my $ramdisk_size, $ramdisk_addr;	# 4
my $second_size, $second_addr;		# 4
my $tags_addr;						# 4
my $page_size;						# 4
my $dt_size;						# 4
my $unused;							# 4
my $name;							# 16
my $cmdline;						# 512
my $id;								# 32

read(FP1, $buffer, 8);
$magic = unpack("A*", $buffer);
read(FP1, $buffer, 4);
$kernel_size = unpack("H*", reverse($buffer));
read(FP1, $buffer, 4);
$kernel_addr = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$ramdisk_size = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$ramdisk_addr = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$second_size = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$second_addr = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$tags_addr = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$page_size = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$dt_size = unpack("H8", reverse($buffer));
read(FP1, $buffer, 4);
$unused = unpack("H8", reverse($buffer));
read(FP1, $buffer, 16);
$name = unpack("A16", $buffer);
read(FP1, $buffer, 512);
$cmdline = unpack("A512", $buffer);
read(FP1, $buffer, 32);
$id = unpack("H32", $buffer);

print "======================================================\n";

printf "Header Info\n";
printf "  magic[8]: $magic\n";
printf "  kernel[8]: size[4]=0x$kernel_size, addr[4]=0x$kernel_addr\n";
printf "  ramdisk[8]: size[4]=0x$ramdisk_size, addr[4]=0x$ramdisk_addr\n";
printf "  second[8]: size[4]=0x$second_size, addr[4]=0x$second_addr\n";
printf "  tags[4]: addr[4]=0x$tags_addr\n";
printf "  page[4]: size[4]=0x$page_size\n";
printf "  dt[4]: size[4]=0x$dt_size\n";
printf "  unused[4]: 0x$unused\n";
printf "  name[16]: $name\n";
printf "  cmdline[512]: $cmdline\n";
printf "  id[32]: $id\n";

print "======================================================\n";

$page_sz_dec=hex($page_size);
$kernel_sz_dec=hex($kernel_size);
$ramdisk_sz_dec=hex($ramdisk_size);
$second_sz_dec=hex($second_size);
$dt_sz_dec=hex($dt_size);

$kernel_page_sz=int(($kernel_sz_dec+$page_sz_dec-1)/$page_sz_dec)*$page_sz_dec;
$ramdisk_page_sz=int(($ramdisk_sz_dec+$page_sz_dec-1)/$page_sz_dec)*$page_sz_dec;
$second_page_sz=int(($second_sz_dec+$page_sz_dec-1)/$page_sz_dec)*$page_sz_dec;
$dt_page_sz=int(($dt_sz_dec+$page_sz_dec-1)/$page_sz_dec)*$page_sz_dec;

$kernel_page_off=$page_size;
$ramdisk_page_off=sprintf("%08x", ($kernel_page_sz+$page_sz_dec));
$second_page_off=sprintf("%08x", ($kernel_page_sz+$page_sz_dec+$ramdisk_page_sz));
$dt_page_off=sprintf("%08x",  ($kernel_page_sz+$page_sz_dec+$ramdisk_page_sz+$second_sz_dec));

printf "Module Offset\n";
printf "  header: offset=0x00000000, size=0x$page_size\n";
printf "  kernel: offset=0x$kernel_page_off, size=0x$kernel_size\n";
printf "  ramdisk: offset=0x$ramdisk_page_off, size=0x$ramdisk_size\n";
printf "  sedond: offset=0x$second_page_off, size=0x$second_size\n";
printf "  dt: offset=0x$dt_page_off, size=0x$dt_size\n";

print "======================================================\n";

close(FP1);
