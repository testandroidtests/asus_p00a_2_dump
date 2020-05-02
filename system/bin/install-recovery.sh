#!/system/bin/sh
if ! applypatch -c EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery:11462912:ff46e5e84fc96d11d8183d37ceb2268a4444cd06; then
  applypatch -b /system/etc/recovery-resource.dat EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/boot:10004736:d221f87014092457e2cb86070894f7416edcb8d3 EMMC:/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/recovery ff46e5e84fc96d11d8183d37ceb2268a4444cd06 11462912 d221f87014092457e2cb86070894f7416edcb8d3:/system/recovery-from-boot.p && log -t recovery "Installing new recovery image: succeeded" || log -t recovery "Installing new recovery image: failed"
else
  log -t recovery "Recovery image already installed"
fi
