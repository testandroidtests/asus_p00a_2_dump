#!/system/bin/sh

#set -x 
setprop sys.adbon.oneshot 0
adbon=`getprop factory.adbon`
CTSadbon=`getprop CTS.Auto.adbon`
state=`getprop sys.usb.state`
if [ $adbon ] || [ $CTSadbon ]; then
    if [ $CTSadbon ]; then
	setprop sys.adbon.oneshot 2
    else
	setprop sys.adbon.oneshot 1
    fi
    while [ "mtp" != "$state" ]
    do
	sleep 1
	state=`getprop sys.usb.state`
    done
    setprop sys.usb.config mtp,adb
fi
