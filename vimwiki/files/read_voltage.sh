function hex() {
	printf "0x%08x" $1
}

function hex3() {
	printf "0x%02x" $1
}

function hex7() {
	printf "0x%02x" $1
}

function read_reg() {
	adb shell lookat $(hex $(($1 + $2))) | sed 's/\r$//'
}

function bin_hex() {
	value=$1
	vshift=$2
	vmask=$3
	echo -n $(`expr hex$vmask` $(($value >> $vshift & $vmask)))
}

val=$(read_reg 0x40038800 0x20)
case `bin_hex $val 14 3` in
	0x00) echo -n 2.80v; ;;
	0x01) echo -n 3.00v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_EMMC_CORE"

case `bin_hex $val 12 3` in
	0x00) echo -n 1.50v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 1.30v; ;;
	0x03) echo -n 1.20v; ;;
esac
echo " -- LDO_EMMC_IO"

case `bin_hex $val 10 3` in
	0x00) echo -n 2.85v; ;;
	0x01) echo -n 2.95v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_RF2"

case `bin_hex $val 8 3` in
	0x00) echo -n 2.85v; ;;
	0x01) echo -n 2.95v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_RF1"

case `bin_hex $val 6 3` in
	0x00) echo -n 2.85v; ;;
	0x01) echo -n 2.95v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_RF0"

case `bin_hex $val 4 3` in
	0x00) echo -n 2.50v; ;;
	0x01) echo -n 2.75v; ;;
	0x02) echo -n 3.00v; ;;
	0x03) echo -n 2.90v; ;;
esac
echo " -- LDO_VDD25"

case `bin_hex $val 2 3` in
	0x00) echo -n 2.80v; ;;
	0x01) echo -n 3.00v; ;;
	0x02) echo -n 2.65v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_VDD28"

case `bin_hex $val 0 3` in
	0x00) echo -n 1.50v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 1.30v; ;;
	0x03) echo -n 1.20v; ;;
esac
echo " -- LDO_VDD18"

val=$(read_reg 0x40038800 0x24)
case `bin_hex $val 8 3` in
	0x00) echo -n 2.80v; ;;
	0x01) echo -n 3.00v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_SIM2"

case `bin_hex $val 6 3` in
	0x00) echo -n 1.80v; ;;
	0x01) echo -n 2.90v; ;;
	0x02) echo -n 3.00v; ;;
	0x03) echo -n 3.10v; ;;
esac
echo " -- LDO_SIM1"

case `bin_hex $val 4 3` in
	0x00) echo -n 1.80v; ;;
	0x01) echo -n 2.90v; ;;
	0x02) echo -n 3.00v; ;;
	0x03) echo -n 3.10v; ;;
esac
echo " -- LDO_SIM0"

case `bin_hex $val 2 3` in
	0x00) echo -n 2.80v; ;;
	0x01) echo -n 3.00v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_SD"

case `bin_hex $val 0 3` in
	0x00) echo -n 1.50v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 1.30v; ;;
	0x03) echo -n 1.20v; ;;
esac
echo " -- LDO_AVDD18"

val=$(read_reg 0x40038800 0x28)
case `bin_hex $val 10 3` in
	0x00) echo -n 1.50v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 1.30v; ;;
	0x03) echo -n 1.20v; ;;
esac
echo " -- LDO_CLSG"

case `bin_hex $val 8 3` in
	0x00) echo -n 3.30v; ;;
	0x01) echo -n 3.40v; ;;
	0x02) echo -n 3.20v; ;;
	0x03) echo -n 3.10v; ;;
esac
echo " -- LDO_USB"

case `bin_hex $val 6 3` in
	0x00) echo -n 3.00v; ;;
	0x01) echo -n 3.30v; ;;
	0x02) echo -n 2.80v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_CAMMOT"

case `bin_hex $val 4 3` in
	0x00) echo -n 1.50v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 2.80v; ;;
esac
echo " -- LDO_CAMIO"

case `bin_hex $val 2 3` in
	0x00) echo -n 1.50v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 1.30v; ;;
	0x03) echo -n 1.20v; ;;
esac
echo " -- LDO_CAMD"

case `bin_hex $val 0 3` in
	0x00) echo -n 2.80v; ;;
	0x01) echo -n 3.00v; ;;
	0x02) echo -n 2.50v; ;;
	0x03) echo -n 1.80v; ;;
esac
echo " -- LDO_CAMA"

val=$(read_reg 0x40038800 0x160)
case `bin_hex $val 5 7` in
	0x00) echo -n 1.10v; ;;
	0x01) echo -n 0.70v; ;;
	0x02) echo -n 0.80v; ;;
	0x03) echo -n 0.90v; ;;
	0x04) echo -n 1.00v; ;;
	0x05) echo -n 0.65v; ;;
	0x06) echo -n 1.20v; ;;
	0x07) echo -n 1.30v; ;;
esac
echo " -- DCDC_CORE_ADI"

val=$(read_reg 0x40038800 0x164)
case `bin_hex $val 5 7` in
	0x00) echo -n 1.10v; ;;
	0x01) echo -n 0.70v; ;;
	0x02) echo -n 0.80v; ;;
	0x03) echo -n 0.90v; ;;
	0x04) echo -n 1.00v; ;;
	0x05) echo -n 0.65v; ;;
	0x06) echo -n 1.20v; ;;
	0x07) echo -n 1.30v; ;;
esac
echo " -- DCDC_ARM_ADI"

val=$(read_reg 0x40038800 0x168)
case `bin_hex $val 5 7` in
	0x00) echo -n 1.20v; ;;
	0x01) echo -n 1.25v; ;;
	0x02) echo -n 1.35v; ;;
	0x03) echo -n 1.30v; ;;
	0x04) echo -n 1.50v; ;;
	0x05) echo -n 1.40v; ;;
	0x06) echo -n 1.80v; ;;
	0x07) echo -n 1.90v; ;;
esac
echo " -- DCDC_MEM_ADI"

val=$(read_reg 0x40038800 0x16c)
case `bin_hex $val 5 7` in
	0x00) echo -n 2.20v; ;;
	0x01) echo -n 1.80v; ;;
	0x02) echo -n 1.90v; ;;
	0x03) echo -n 2.00v; ;;
	0x04) echo -n 2.10v; ;;
	0x05) echo -n 2.30v; ;;
	0x06) echo -n 2.40v; ;;
	0x07) echo -n 2.50v; ;;
esac
echo " -- DCDC_GEN_ADI"

val=$(read_reg 0x40038800 0x170)
case `bin_hex $val 5 7` in
	0x00) echo -n 0.90v; ;;
	0x01) echo -n 1.30v; ;;
	0x02) echo -n 1.10v; ;;
	0x03) echo -n 1.50v; ;;
	0x04) echo -n 2.40v; ;;
	0x05) echo -n 2.60v; ;;
	0x06) echo -n 2.80v; ;;
	0x07) echo -n 3.00v; ;;
esac
echo " -- DCDC_WRF_ADI"





