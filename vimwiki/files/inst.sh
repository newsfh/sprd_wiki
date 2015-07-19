adb push gatord /data/local/tmp
adb push driver-src/gator-driver/gator.ko /data/local/tmp
adb push hrtimer_module/hrtimer_module.ko /data/local/tmp
adb shell insmod /data/local/tmp/gator.ko
adb shell insmod /data/local/tmp/hrtimer_module.ko
adb shell /data/local/tmp/gatord &
adb forward tcp:8080 tcp:8080
