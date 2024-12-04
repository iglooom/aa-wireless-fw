CONFIG_SYS_PATH=/sys/kernel/config/usb_gadget/rockchip

echo "none" > $CONFIG_SYS_PATH/UDC
sleep 0.2
cd $CONFIG_SYS_PATH

rm configs/b.1/ptp_sd.usb0
rmdir configs/b.1/strings/0x409
rmdir configs/b.1
sleep 0.1

rm configs/b.2/audio_sd.usb0
rm configs/b.2/hid_sd.usb0
rmdir configs/b.2/strings/0x409
rmdir configs/b.2
sleep 0.1
rm configs/b.3/mux_sd.usb0
rm configs/b.3/ptp_sd.usb0
rmdir configs/b.3/strings/0x409
rmdir configs/b.3
sleep 0.1
rm configs/b.4/mux_sd.usb0
rm configs/b.4/ptp_sd.usb0
rm configs/b.4/vsc_sd.usb0
rmdir configs/b.4/strings/0x409
rmdir configs/b.4
sleep 0.1

rmdir functions/audio_sd.usb0
rmdir functions/hid_sd.usb0
rmdir functions/mux_sd.usb0
rmdir functions/ptp_sd.usb0
rmdir functions/vsc_sd.usb0
sleep 0.1

rmdir strings/0x409

cd ..
rmdir rockchip
