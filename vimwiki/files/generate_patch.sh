#!/bin/sh

if [ $# -lt 2 ] || [ $# -gt 3 ]; then
	filename=$(basename "$0")
	echo "error: param not right!"
	echo "  $filename <before_commit_id> <after_commit_id> [output_folder]"
	exit
fi

commita=$1
commitb=$2

delta_path=.
if [ "$3" ]; then
	delta_path=$3
fi

if [ ! -e $delta_path ]; then
	echo "output folder <$delta_path> not exist"
	exit
fi

bfilelist=$(git diff $commita..$commitb --name-status | grep "^[D|M]" | cut -c2- | sort)
echo "before:$bfilelist"
 
if [ "bfilelist" ]; then
  git archive -o $delta_path/before.tar $commita $bfilelist
fi
 
# get commitb files and pack it
afilelist=$(git diff $commita..$commitb --name-status | grep "^[A|M]" | cut -c2- | sort)
echo "after:$afilelist"
if [ "afilelist" ]; then
  git archive -o $delta_path/after.tar $commitb $afilelist
fi

