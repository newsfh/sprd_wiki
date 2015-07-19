#!/bin/bash
file="$1"
[ -f "$file" -a "$file" != "" ] || {
	echo
	echo "can't open kernel panic file < $file >"
	echo
	exit 1;
}
tmp_file="$(readlink -f ~/.trace32-kernel_panic.regs)"
sed -n '/pc\ :\ \[</,/r3\ :\ .*r2\ :.*r1\ :.*r0/p' $file > ${tmp_file}
# pc, lr, cpsr
sed -n 1p ${tmp_file} | \
sed 's/.*pc.*<\(.*\)>.*lr.*<\(.*\)>.*psr:\ \(.*\)\ */r\.set\ cpsr\ 0x\3\nr\.set\ pc\ 0x\1\nr\.set\ r14\ 0x\2/' | \
sed 's/\ *$//g'
# sp, ip, fp
sed -n 2p ${tmp_file} | \
sed 's/.*sp\ *:\ *\(.*\)\ *ip\ *:\ *\(.*\)\ *fp\ *:\ *\(.*\)\ */r\.set\ r13\ 0x\1\nr\.set\ r12\ 0x\2\nr\.set\ r11\ 0x\3/' | \
sed 's/\ *$//g'
# r10, r9, r9
sed -n 3p ${tmp_file} | \
sed 's/.*r10\ *:\ *\(.*\)\ *r9\ *:\ *\(.*\)\ *r8\ *:\ *\(.*\)\ */r\.set\ r10\ 0x\1\nr\.set\ r9\ 0x\2\nr\.set\ r8\ 0x\3/' | \
sed 's/\ *$//g'
echo
# r7, r6, r5, r4
sed -n 4p ${tmp_file} | \
sed 's/.*r7\ *:\ *\(.*\)\ *r6\ *:\ *\(.*\)\ *r5\ *:\ *\(.*\)\ *r4\ *:\ *\(.*\)\ */r\.set\ r7\ 0x\1\nr\.set\ r6\ 0x\2\nr\.set\ r5\ 0x\3\nr\.set\ r4\ 0x\4/' | \
sed 's/\ *$//g'
# r3, r2, r1, r0
sed -n 5p ${tmp_file} | \
sed 's/.*r3\ *:\ *\(.*\)\ *r2\ *:\ *\(.*\)\ *r1\ *:\ *\(.*\)\ *r0\ *:\ *\(.*\)\ */r\.set\ r3\ 0x\1\nr\.set\ r2\ 0x\2\nr\.set\ r1\ 0x\3\nr\.set\ r0\ 0x\4/' | \
sed 's/\ *$//g'
echo
rm -f ${tmp_file}
