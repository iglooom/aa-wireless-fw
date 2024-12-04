mount -t configfs none /sys/kernel/config
mkdir -p /sys/kernel/config/usb_gadget/sunxi
echo "0x18d1" > /sys/kernel/config/usb_gadget/sunxi/idVendor
echo "0x2d00" > /sys/kernel/config/usb_gadget/sunxi/idProduct
echo "0x1001" > /sys/kernel/config/usb_gadget/sunxi/bcdDevice
mkdir /sys/kernel/config/usb_gadget/sunxi/functions/accessory.usb0
echo 0xc0 > /sys/kernel/config/usb_gadget/sunxi/configs/b.1/bmAttributes
echo Accessory > /sys/kernel/config/usb_gadget/sunxi/configs/b.1/strings/0x409/configuration
rm /sys/kernel/config/usb_gadget/sunxi/configs/b.1/mtp.gs0
ln -s /sys/kernel/config/usb_gadget/sunxi/functions/accessory.usb0 /sys/kernel/config/usb_gadget/sunxi/configs/b.1
echo 4100000.udc-controller > /sys/kernel/config/usb_gadget/sunxi/UDC


