
mount -t configfs none /sys/kernel/config
cd /sys/kernel/config/usb_gadget/
mkdir -p sunxi
cd sunxi
echo "0x05ac"  > idVendor
echo "0x12a8" > idProduct
echo "0x1001" > bcdDevice
mkdir strings/0x409

if [ $# -eq 0 ] ; then
echo "sd7dbf3e8b26" > strings/0x409/serialnumber
else
echo "get input $1 "
echo $1 > strings/0x409/serialnumber
fi
echo "Apple Inc."  > strings/0x409/manufacturer
echo "iPhone"  > strings/0x409/product

mkdir functions/ptp_sd.usb0
mkdir functions/audio_sd.usb0
mkdir functions/hid_sd.usb0
mkdir functions/mux_sd.usb0
mkdir functions/vsc_sd.usb0

rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.1
rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.2
rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.3
rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.4

mkdir configs/b.1
echo 0xc0 > configs/b.1/bmAttributes
mkdir configs/b.1/strings/0x409
echo "PTP" > configs/b.1/strings/0x409/configuration
ln -s functions/ptp_sd.usb0 configs/b.1

mkdir configs/b.2
echo 0xc0 > configs/b.2/bmAttributes
mkdir configs/b.2/strings/0x409
echo "iPod USB Interface" > configs/b.2/strings/0x409/configuration
ln -s functions/audio_sd.usb0 configs/b.2
ln -s functions/hid_sd.usb0 configs/b.2

mkdir configs/b.3
echo 0xc0 > configs/b.3/bmAttributes
mkdir configs/b.3/strings/0x409
echo "PTP + Apple Mobile Device" > configs/b.3/strings/0x409/configuration
ln -s functions/ptp_sd.usb0 configs/b.3
ln -s functions/mux_sd.usb0 configs/b.3

mkdir configs/b.4
echo 0xc0 > configs/b.4/bmAttributes
mkdir configs/b.4/strings/0x409
echo "PTP + Apple Mobile Device + Apple USB Ethernet" > configs/b.4/strings/0x409/configuration
ln -s functions/ptp_sd.usb0 configs/b.4
ln -s functions/mux_sd.usb0 configs/b.4
ln -s functions/vsc_sd.usb0 configs/b.4

#echo peripheral > /sys/devices/platform/20008000.syscon/20008000.syscon:usb2-phy@17c/otg_mode
echo 4100000.udc-controller > /sys/kernel/config/usb_gadget/sunxi/UDC


