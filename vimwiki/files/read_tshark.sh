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

echo "===============================  module eb list ================================="
##### AHB_EB
val=$(read_reg 0x20d00000 0x00)
echo "=== AHB_EB(0x20d00000 : $val) ==="

print_bit $val 22 "LVDS_EB"
print_bit $val 21 "ZIPDEC_EB"
print_bit $val 20 "ZIPENC_EB"
print_bit $val 19 "NANDC_ECC_EB"
print_bit $val 18 "NANDC_2X_EB"
print_bit $val 17 "NANDC_EB"
print_bit $val 16 "BUSMON2_EB"
print_bit $val 15 "BUSMON1_EB"
print_bit $val 14 "BUSMON0_EB"
print_bit $val 13 "SPINLOCK_EB"
print_bit $val 12 "GPS_EB"
print_bit $val 11 "EMMC_EB"
print_bit $val 10 "SDIO2_EB"
print_bit $val 9 "SDIO1_EB"
print_bit $val 8 "SDIO0_EB"
print_bit $val 7 "DRM_EB"
print_bit $val 6 "NFC_EB"
print_bit $val 5 "DMA_EB"
print_bit $val 4 "USB_EB"
print_bit $val 3 "GSP_EB"
print_bit $val 2 "DISPC1_EB"
print_bit $val 1 "DISPC0_EB"
print_bit $val 0 "DSI_EB"
echo " "

##### APB_EB
val=$(read_reg 0x71300000 0x0)
echo "=== APB_EB(0x71300000 : $val) ==="

print_bit $val 22 "INTC3_EB"
print_bit $val 21 "INTC2_EB"
print_bit $val 20 "INTC1_EB"
print_bit $val 19 "INTC0_EB"
print_bit $val 18 "CKG_EB"
print_bit $val 17 "UART4_EB"
print_bit $val 16 "UART3_EB"
print_bit $val 15 "UART2_EB"
print_bit $val 14 "UART1_EB"
print_bit $val 13 "UART0_EB"
print_bit $val 12 "I2C4_EB"
print_bit $val 11 "I2C3_EB"
print_bit $val 10 "I2C2_EB"
print_bit $val 9 "I2C1_EB"
print_bit $val 8 "I2C0_EB"
print_bit $val 7 "SPI2_EB"
print_bit $val 6 "SPI1_EB"
print_bit $val 5 "SPI0_EB"
print_bit $val 4 "IIS3_EB"
print_bit $val 3 "IIS2_EB"
print_bit $val 2 "IIS1_EB"
print_bit $val 1 "IIS0_EB"
print_bit $val 0 "SIM0_EB"
echo " "

##### AON_APB_EB0
val=$(read_reg 0x402e0000 0x0)
echo "=== AON_APB_EB0(0x402e0000 : $val) ==="

print_bit $val 31 "I2C_EB"
print_bit $val 30 "CA7_DAP_EB"
print_bit $val 29 "CA7_TS1_EB"
print_bit $val 28 "CA7_TS0_EB"
print_bit $val 27 "GPU_EB"
print_bit $val 26 "CKG_EB"
print_bit $val 25 "MM_EB"
print_bit $val 24 "AP_WDG_EB"
print_bit $val 23 "MSPI_EB"
print_bit $val 22 "SPLK_EB"
print_bit $val 21 "IPI_EB"
print_bit $val 20 "PIN_EB"
print_bit $val 19 "VBC_EB"
print_bit $val 18 "AUD_EB"
print_bit $val 17 "AUDIF_EB"
print_bit $val 16 "ADI_EB"
print_bit $val 15 "INTC_EB"
print_bit $val 14 "EIC_EB"
print_bit $val 13 "EFUSE_EB"
print_bit $val 12 "AP_TMR0_EB"
print_bit $val 11 "AON_TMR_EB"
print_bit $val 10 "AP_SYST_EB"
print_bit $val 9 "AON_SYST_EB"
print_bit $val 8 "KPD_EB"
print_bit $val 7 "PWM3_EB"
print_bit $val 6 "PWM2_EB"
print_bit $val 5 "PWM1_EB"
print_bit $val 4 "PWM0_EB"
print_bit $val 3 "GPIO_EB"
print_bit $val 2 "TPC_EB"
print_bit $val 1 "FM_EB"
print_bit $val 0 "ADC_EB"
echo " "

##### AON_APB_EB1
val=$(read_reg 0x402e0000 0x4)
echo "=== AON_APB_EB1(0x402e0004 : $val) ==="

print_bit $val 13 "GSP_EMC_EB"
print_bit $val 12 "ZIP_EMC_EB"
print_bit $val 11 "DISP_EMC_EB"
print_bit $val 10 "AP_TMR2_EB"
print_bit $val 9 "AP_TMR1_EB"
print_bit $val 8 "CA7_WDG_EB"
print_bit $val 7 "AVS1_EB"
print_bit $val 6 "AVS0_EB"
print_bit $val 5 "PROBE_EB"
print_bit $val 4 "AUX2_EB"
print_bit $val 3 "AUX1_EB"
print_bit $val 2 "AUX0_EB"
print_bit $val 1 "THM_EB"
print_bit $val 0 "PMU_EB"
echo " "

echo "=================================================================================="

echo "===============================  sleep status  ================================="
##### CP_SLP_STATUS_DBG0
val=$(read_reg 0x402b0000 0xb4)
echo "=== CP_SLP_STATUS_DBG0(0x402b00b4 : $val) ==="

print_bit $val 15 "tmr_autopd_xtl_2g"
print_bit $val 14 "tmr_autopd_xtl_3g_w"
print_bit $val 13 "clk_ecc_en"
print_bit $val 12 "clk_qbc_en"
print_bit $val 11 "dsp_stop"
print_bit $val 10 "wsys_stop"
print_bit $val 9 "dsp_peri_stop"
print_bit $val 8 "mcu_peri_stop"
print_bit $val 7 "mcu_sys_stop"
print_bit $val 6 "mcu_deep_stop"
print_bit $val 5 "dsp_mahb_sleep_en"
print_bit $val 4 "ashb_dsptoarm_valid"
print_bit $val 3 "mcu_stop"
print_bit $val 2 "ahb_stop"
print_bit $val 1 "mtx_stop"
print_bit $val 0 "arm_stop"
echo " "


echo "=================================================================================="

