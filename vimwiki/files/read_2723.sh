function hex() {
	printf "0x%08x" $1
}

function hex1() {
	printf "0x%02x" $1
}

function hex3() {
	printf "0x%02x" $1
}

function hex4() {
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

function print_bit() {
	reg_val=$1
	reg_bit=$2
	info=$3

	echo -n "[$reg_bit]"
	case `bin_hex $reg_val $reg_bit 1` in
		0x00) echo " //$info" ;;
		0x01) echo " $info" ;;
	esac
}

##### ANA_REG_GLB_LDO_DCDC_PD
val=$(read_reg 0x40038800 0x10)
echo "=== ANA_REG_GLB_LDO_DCDC_PD(0x40038810 : $val) ==="

print_bit $val 15 "LDO_EMM_PD"
print_bit $val 14 "DCDC_TOPCLK6M_PD"
print_bit $val 13 "DCDC_RF_PD"
print_bit $val 12 "DCDC_GEN_PD"
print_bit $val 11 "DCDC_MEM_PD"
print_bit $val 10 "DCDC_ARM_PD"
print_bit $val 9 "DCDC_CORE_PD"
print_bit $val 8 "LDO_RF0_PD"
print_bit $val 7 "LDO_EMMCCORE_PD"
print_bit $val 6 "LDO_GEN1_PD"
print_bit $val 5 "LDO_DCXO_PD"
print_bit $val 4 "LDO_GEN0_PD"
print_bit $val 3 "LDO_VDD25_PD"
print_bit $val 2 "LDO_VDD28_PD"
print_bit $val 1 "LDO_VDD18_PD"
print_bit $val 0 "BG_PD"
echo " "

#### ANA_REG_GLB_LDO_PD_CTRL
val=$(read_reg 0x40038800 0x14)
echo "=== ANA_REG_GLB_LDO_PD_CTRL(0x40038814 : $val) ==="

print_bit $val 15 "LDO_LPREF_PD_SW"
print_bit $val 14 "DCDC_WPA_PD"
print_bit $val 13 "DCDC_CON_PD"
#print_bit $val 12 "DCDC_GEN_PD"
print_bit $val 11 "LDO_WIFIPA_PD"
print_bit $val 10 "LDO_SDCORE_PD"
#print_bit $val 9 "DCDC_CORE_PD"
print_bit $val 8 "LDO_USB_PD"
print_bit $val 7 "LDO_CAMMOT_PD"
print_bit $val 6 "LDO_CAMIO_PD"
print_bit $val 5 "LDO_CAMD_PD"
print_bit $val 4 "LDO_CAMA_PD"
print_bit $val 3 "LDO_SIM2_PD"
print_bit $val 2 "LDO_SIM1_PD"
print_bit $val 1 "LDO_SIM0_PD"
print_bit $val 0 "LDO_SDIO_PD"
echo " "

##### ANA_REG_GLB_PWR_SLP_CTRL0
val=$(read_reg 0x40038800 0x90)
echo "=== ANA_REG_GLB_PWR_SLP_CTRL0(0x40038890 : $val) ==="

print_bit $val 15 "SLP_IO_EN"
#print_bit $val 14 ""
print_bit $val 13 "SLP_DCDCRF_PD_EN"
print_bit $val 12 "SLP_DCDCCON_PD_EN"
print_bit $val 11 "SLP_DCDCGEN_PD_EN"
print_bit $val 10 "SLP_DCDCWPA_PD_EN"
print_bit $val 9 "SLP_DCDCARM_PD_EN"
print_bit $val 8 "SLP_LDOVDD25_PD_EN"
print_bit $val 7 "SLP_LDORF0_PD_EN"
print_bit $val 6 "SLP_LDOEMMCCORE_PD_EN"
print_bit $val 5 "SLP_LDOGEN0_PD_EN"
print_bit $val 4 "SLP_LDODCXO_PD_EN"
print_bit $val 3 "SLP_LDOGEN1_PD_EN"
print_bit $val 2 "SLP_LDOWIFIPA_PD_EN"
print_bit $val 1 "SLP_LDOVDD28_PD_EN"
print_bit $val 0 "SLP_LDOVDD18_PD_EN"
echo " "

##### ANA_REG_GLB_PWR_SLP_CTRL1
val=$(read_reg 0x40038800 0x94)
echo "=== ANA_REG_GLB_PWR_SLP_CTRL1(0x40038894 : $val) ==="

print_bit $val 15 "SLP_LDO_PD_EN"
print_bit $val 14 "SLP_LDOLPREF_PD_EN"
#print_bit $val 13 "DCDC_RF_PD"
#print_bit $val 12 "DCDC_GEN_PD"
#print_bit $val 11 ""
#print_bit $val 10 "DCDC_ARM_PD"
print_bit $val 9 "SLP_LDOSDCORE_PD_EN"
print_bit $val 8 "SLP_LDOUSB_PD_EN"
print_bit $val 7 "SLP_LDOCAMMOT_PD_EN"
print_bit $val 6 "SLP_LDOCAMIO_PD_EN"
print_bit $val 5 "SLP_LDOCAMD_PD_EN"
print_bit $val 4 "SLP_LDOCAMA_PD_EN"
print_bit $val 3 "SLP_LDOSIM2_PD_EN"
print_bit $val 2 "SLP_LDOSIM1_PD_EN"
print_bit $val 1 "SLP_LDOSIM0_PD_EN"
print_bit $val 0 "SLP_LDOSDIO_PD_EN"
echo " "

##### ANA_REG_GLB_PWR_SLP_CTRL2
val=$(read_reg 0x40038800 0x98)
echo "=== ANA_REG_GLB_PWR_SLP_CTRL2(0x40038898 : $val) ==="

#print_bit $val 15 ""
print_bit $val 14 "SLP_DCDCRF_LP_EN"
print_bit $val 13 "SLP_DCDCCON_LP_EN"
print_bit $val 12 "SLP_DCDCCORE_LP_EN"
print_bit $val 11 "SLP_DCDCMEM_LP_EN"
print_bit $val 10 "SLP_DCDCARM_LP_EN"
print_bit $val 9 "SLP_DCDCGEN_LP_EN"
print_bit $val 8 "SLP_DCDCWPA_LP_EN"
print_bit $val 7 "SLP_LDORF0_LP_EN"
print_bit $val 6 "SLP_LDOEMMCCORE_LP_EN"
print_bit $val 5 "SLP_LDOGEN0_LP_EN"
print_bit $val 4 "SLP_LDODCXO_LP_EN"
print_bit $val 3 "SLP_LDOGEN1_LP_EN"
print_bit $val 2 "SLP_LDOWIFIPA_LP_EN"
print_bit $val 1 "SLP_LDOVDD28_LP_EN"
print_bit $val 0 "SLP_LDOVDD18_LP_EN"
echo " "

##### ANA_REG_GLB_PWR_SLP_CTRL3
val=$(read_reg 0x40038800 0x9c)
echo "=== ANA_REG_GLB_PWR_SLP_CTRL3(0x4003889c : $val) ==="

print_bit $val 15 "SLP_BG_LP_EN"
print_bit $val 14 "LDOVDD25_LP_EN_SW"
print_bit $val 13 "LDOSDCORE_LP_EN_SW"
print_bit $val 12 "LDOUSB_LP_EN_SW"
#print_bit $val 11 "DCDC_MEM_PD"
print_bit $val 10 "SLP_LDOVDD25_LP_EN"
print_bit $val 9 "SLP_LDOSDCORE_LP_EN"
print_bit $val 8 "SLP_LDOUSB_LP_EN"
print_bit $val 7 "SLP_LDOCAMMOT_LP_EN"
print_bit $val 6 "SLP_LDOCAMIO_LP_EN"
print_bit $val 5 "SLP_LDOCAMD_LP_EN"
print_bit $val 4 "SLP_LDOCAMA_LP_EN"
print_bit $val 3 "SLP_LDOSIM2_LP_EN"
print_bit $val 2 "SLP_LDOSIM1_LP_EN"
print_bit $val 1 "SLP_LDOSIM0_LP_EN"
print_bit $val 0 "SLP_LDOSDIO_LP_EN"
echo " "

##### ANA_REG_GLB_PWR_SLP_CTRL4
val=$(read_reg 0x40038800 0xa0)
echo "=== ANA_REG_GLB_PWR_SLP_CTRL4(0x400388a0 : $val) ==="

print_bit $val 15 "LDOCAMIO_LP_EN_SW"
print_bit $val 14 "LDOCAMMOT_LP_EN_SW"
print_bit $val 13 "LDOCAMD_LP_EN_SW"
print_bit $val 12 "LDOCAMA_LP_EN_SW"
print_bit $val 11 "LDOSIM2_LP_EN_SW"
print_bit $val 10 "LDOSIM1_LP_EN_SW"
print_bit $val 9 "LDOSIM0_LP_EN_SW"
print_bit $val 8 "LDOSDIO_LP_EN_SW"
print_bit $val 7 "LDORF0_LP_EN_SW"
print_bit $val 6 "LDOEMMCCORE_LP_EN_SW"
print_bit $val 5 "LDOGEN0_LP_EN_SW"
print_bit $val 4 "LDODCXO_LP_EN_SW"
print_bit $val 3 "LDOGEN1_LP_EN_SW"
print_bit $val 2 "LDOWIFIPA_LP_EN_SW"
print_bit $val 1 "LDOVDD28_LP_EN_SW"
print_bit $val 0 "LDOVDD18_LP_EN_SW"
echo " "

##### ANA_REG_GLB_PWR_XTL_EN0
val=$(read_reg 0x40038800 0xc4)
echo "=== ANA_REG_GLB_PWR_XTL_EN0(0x400388c4 : $val) ==="

print_bit $val 15 "LDO_XTL_EN"
print_bit $val 14 "LDO_GEN0_EXT_XTL0_EN"
print_bit $val 13 "LDO_GEN0_XTL1_EN"
print_bit $val 12 "LDO_GEN0_XTL0_EN"
print_bit $val 11 "LDO_GEN1_EXT_XTL0_EN"
print_bit $val 10 "LDO_GEN1_XTL1_EN"
print_bit $val 9 "LDO_GEN1_XTL0_EN"
print_bit $val 8 "LDO_DCXO_EXT_XTL0_EN"
print_bit $val 7 "LDO_DCXO_XTL1_EN"
print_bit $val 6 "LDO_DCXO_XTL0_EN"
print_bit $val 5 "LDO_VDD18_EXT_XTL0_EN"
print_bit $val 4 "LDO_VDD18_XTL1_EN"
print_bit $val 3 "LDO_VDD18_XTL0_EN"
print_bit $val 2 "LDO_VDD28_EXT_XTL0_EN"
print_bit $val 1 "LDO_VDD28_XTL1_EN"
print_bit $val 0 "LDO_VDD28_XTL0_EN"
echo " "

##### ANA_REG_GLB_PWR_XTL_EN1
val=$(read_reg 0x40038800 0xc8)
echo "=== ANA_REG_GLB_PWR_XTL_EN0(0x400388c8 : $val) ==="

#print_bit $val 15 "LDO_XTL_EN"
print_bit $val 14 "LDO_RF0_EXT_XTL0_EN"
print_bit $val 13 "LDO_RF0_XTL1_EN"
print_bit $val 12 "LDO_RF0_XTL0_EN"
print_bit $val 11 "LDO_WIFIPA_EXT_XTL0_EN"
print_bit $val 10 "LDO_WIFIPA_XTL1_EN"
print_bit $val 9 "LDO_WIFIPA_XTL0_EN"
print_bit $val 8 "LDO_SIM2_EXT_XTL0_EN"
print_bit $val 7 "LDO_SIM2_XTL1_EN"
print_bit $val 6 "LDO_SIM2_XTL0_EN"
print_bit $val 5 "LDO_SIM1_EXT_XTL0_EN"
print_bit $val 4 "LDO_SIM1_XTL1_EN"
print_bit $val 3 "LDO_SIM1_XTL0_EN"
print_bit $val 2 "LDO_SIM0_EXT_XTL0_EN"
print_bit $val 1 "LDO_SIM0_XTL1_EN"
print_bit $val 0 "LDO_SIM0_XTL0_EN"
echo " "

##### ANA_REG_GLB_PWR_XTL_EN2
val=$(read_reg 0x40038800 0xcc)
echo "=== ANA_REG_GLB_PWR_XTL_EN0(0x400388cc : $val) ==="

#print_bit $val 15 "LDO_XTL_EN"
#print_bit $val 14 "LDO_RF0_EXT_XTL0_EN"
#print_bit $val 13 "LDO_RF0_XTL1_EN"
#print_bit $val 12 "LDO_RF0_XTL0_EN"
print_bit $val 11 "LDO_VDD25_EXT_XTL0_EN"
print_bit $val 10 "LDO_VDD25_XTL1_EN"
print_bit $val 9 "LDO_VDD25_XTL0_EN"
print_bit $val 8 "DCDC_RF_EXT_XTL0_EN"
print_bit $val 7 "DCDC_RF_XTL1_EN"
print_bit $val 6 "DCDC_RF_XTL0_EN"
print_bit $val 5 "XO_EXT_XTL0_EN"
print_bit $val 4 "XO_XTL1_EN"
print_bit $val 3 "XO_XTL0_EN"
print_bit $val 2 "BG_EXT_XTL0_EN"
print_bit $val 1 "BG_XTL1_EN"
print_bit $val 0 "BG_XTL0_EN"
echo " "

##### ANA_REG_GLB_PWR_XTL_EN3
val=$(read_reg 0x40038800 0xd0)
echo "=== ANA_REG_GLB_PWR_XTL_EN0(0x400388d0 : $val) ==="

#print_bit $val 15 "LDO_XTL_EN"
print_bit $val 14 "DCDC_CON_EXT_XTL0_EN"
print_bit $val 13 "DCDC_CON_XTL1_EN"
print_bit $val 12 "DCDC_CON_XTL0_EN"
print_bit $val 11 "DCDC_WPA_EXT_XTL0_EN"
print_bit $val 10 "DCDC_WPA_XTL1_EN"
print_bit $val 9 "DCDC_WPA_XTL0_EN"
print_bit $val 8 "DCDC_MEM_EXT_XTL0_EN"
print_bit $val 7 "DCDC_MEM_XTL1_EN"
print_bit $val 6 "DCDC_MEM_XTL0_EN"
print_bit $val 5 "DCDC_GEN_EXT_XTL0_EN"
print_bit $val 4 "DCDC_GEN_XTL1_EN"
print_bit $val 3 "DCDC_GEN_XTL0_EN"
print_bit $val 2 "DCDC_CORE_EXT_XTL0_EN"
print_bit $val 1 "DCDC_CORE_XTL1_EN"
print_bit $val 0 "DCDC_CORE_XTL0_EN"
echo " "

########################   print ldo
function hex_1() {
	printf "%08x" $1
}

function ldo_hex() {
	value=$1
	vshift=$2
	vmask=$3
	echo -n $(`expr hex_1` $(($value >> $vshift & $vmask)) | tr a-z A-Z)
}

function print_ldo() {
	ldo_name=$1
	reg_val=$2
	reg_bit=$3
	reg_mask=$4   #$(echo "obase=10; ibase=16; $4"|bc)
	vol_start=$5
	vol_step=$6

	echo -n "$ldo_name : "
	vol=$(ldo_hex $reg_val $reg_bit $reg_mask)
	vol_dec=$(echo "obase=10; ibase=16; $vol"|bc);
	real_vol=$(echo $vol_start+$vol_dec*$vol_step|bc);
	echo $real_vol "mV"
}

function print_dcdc() {
	ldo_name=$1
	reg_val=$2
	vol_step=$3
	vol_base=$4

	echo -n "$ldo_name : "
	cal_vol=$(ldo_hex $reg_val 0 0x1f | tr a-z A-Z)
	cal_dec=$(echo "obase=10; ibase=16; $cal_vol"|bc|tr a-z A-Z);
	real_vol=$(echo $vol_base+$cal_dec*$vol_step|bc);
	echo $real_vol "mV"
}

function print_dcdc_1() {
	ldo_name=$1
	reg_val=$2

	echo -n "$ldo_name : "

	cal_vol=$(ldo_hex $reg_val 0 0x1f | tr a-z A-Z)
	cal_dec=$(echo "obase=10; ibase=16; $cal_vol"|bc|tr a-z A-Z);

	base_vol=$(ldo_hex $reg_val 5 0x1f | tr a-z A-Z)
	base_dec=$(echo "obase=10; ibase=16; $base_vol"|bc|tr a-z A-Z);

	real_vol=$(echo $base_dec*100+600+$cal_dec*"100/32"|bc);
	echo $real_vol "mV"
}

### DCDC_CORE_ADI 
val=$(read_reg 0x40038800 0x200)
case `ldo_hex $val 5 0x1f` in
	00000000) base_v=1100 ;;
	00000001) base_v=700 ;;
	00000002) base_v=800 ;;
	00000003) base_v=900 ;;
	00000004) base_v=1000 ;;
	00000005) base_v=650 ;;
	00000006) base_v=1200 ;;
	00000007) base_v=1300 ;;
esac
print_dcdc "DCDC_CORE" $val "100/32" $base_v

###  DCDC_ARM_ADI
val=$(read_reg 0x40038800 0x204)
case `ldo_hex $val 5 0x1f` in
	00000000) base_v=1100 ;;
	00000001) base_v=700 ;;
	00000002) base_v=800 ;;
	00000003) base_v=900 ;;
	00000004) base_v=1000 ;;
	00000005) base_v=650 ;;
	00000006) base_v=1200 ;;
	00000007) base_v=1300 ;;
esac
print_dcdc "DCDC_ARM" $val "100/32" $base_v

### DCDC_MEM_ADI
val=$(read_reg 0x40038800 0x208)
print_dcdc_1 "DCDC_MEM" $val

### DCDC_GEN_ADI
val=$(read_reg 0x40038800 0x20c)
print_dcdc_1 "DCDC_GEN" $val

### DCDC_CON_ADI
val=$(read_reg 0x40038800 0x218)
print_dcdc_1 "DCDC_CON" $val

### DCDC_RF_ADI
val=$(read_reg 0x40038800 0x21c)
print_dcdc_1 "DCDC_RF" $val

### LDO_V_CTRL0
val=$(read_reg 0x40038800 0x18)
print_ldo "LDO_WIFIPA" $val 0 0xff 1200 10
print_ldo "LDO_RF0" $val 8 0xff 1150 "6.25"

### LDO_V_CTRL1
val=$(read_reg 0x40038800 0x1c)
print_ldo "LDO_CAMD" $val 0 0x7f 1150 "6.25"
print_ldo "LDO_CAMIO" $val 8 0x7f 1150 "6.25"

### LDO_V_CTRL2
val=$(read_reg 0x40038800 0x20)
print_ldo "LDO_GEN0" $val 0 0x7f 1150 "6.25"

### LDO_V_CTRL3
val=$(read_reg 0x40038800 0x24)
print_ldo "LDO_VDD28" $val 0 0xff 1200 "10"
print_ldo "LDO_GEN1" $val 8 0x7f 1150 "6.25"

### LDO_V_CTRL4
val=$(read_reg 0x40038800 0x28)
print_ldo "LDO_SDIO" $val 0 0xff 1200 10
print_ldo "LDO_SIM0" $val 8 0xff 1200 10

### LDO_V_CTRL5
val=$(read_reg 0x40038800 0x2c)
print_ldo "LDO_SIM1" $val 0 0xff 1200 10
print_ldo "LDO_SIM2" $val 8 0xff 1200 10

### LDO_V_CTRL6
val=$(read_reg 0x40038800 0x30)
print_ldo "LDO_CAMA" $val 0 0xff 1200 10
print_ldo "LDO_SDCORE" $val 8 0xff 1200 10

### LDO_V_CTRL7
val=$(read_reg 0x40038800 0x34)
print_ldo "LDO_CAMMOT" $val 0 0xff 1200 10
print_ldo "LDO_EMMCCORE" $val 8 0xff 1200 10

### LDO_V_CTRL8
val=$(read_reg 0x40038800 0x38)
print_ldo "LDO_DCXO_LP" $val 0 0xff 1200 10
print_ldo "LDO_DCXO" $val 8 0xff 1200 10

### LDO_V_CTRL9
val=$(read_reg 0x40038800 0x3c)
print_ldo "LDO_USB" $val 0 0xff 1200 10
print_ldo "LDO_VDD18" $val 8 0x7f 1150 "6.25"

### LDO_V_CTRL10
val=$(read_reg 0x40038800 0x40)
print_ldo "VDD25" $val 0 0xff 1200 10

### KPLED_CTRL
val=$(read_reg 0x40038800 0xf4)
print_ldo "KPLED" $val 0 0xff 1200 10

### VIBR_CTRL0
val=$(read_reg 0x40038800 0xf8)
print_ldo "VIBR" $val 0 0xff 1200 10



