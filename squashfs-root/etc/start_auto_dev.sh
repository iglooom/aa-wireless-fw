
mount -t configfs none /sys/kernel/config
cd /sys/kernel/config/usb_gadget/
mkdir -p sunxi
cd sunxi
echo "0x18d1"  > idVendor
echo "0x4ee1" > idProduct
echo "0x1001" > bcdDevice
mkdir strings/0x409

if [ $# -eq 0 ] ; then
echo "sd7dbf3e8b26" > strings/0x409/serialnumber
else
echo "get input $1 "
echo $1 > strings/0x409/serialnumber
fi

manu=`getprop persist.product.name`
echo "Google"  > strings/0x409/manufacturer
if [ x"$manu" == x"" ];then
	echo "WirelessDongle"  > strings/0x409/product
else
	echo $manu  > strings/0x409/product
fi

mkdir functions/mtp.gs0

rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.1
rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.2
rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.3
rm -rf /sys/kernel/config/usb_gadget/sunxi/configs/b.4

mkdir configs/b.1
echo 0xc0 > configs/b.1/bmAttributes
mkdir configs/b.1/strings/0x409
ln -s functions/mtp.gs0 configs/b.1

echo 4100000.udc-controller > /sys/kernel/config/usb_gadget/sunxi/UDC
