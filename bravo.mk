#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic GSM bravo,
# not specialized for any geography.
#

# First, the most specific values, i.e. the aspects that are specific to GSM

DEVICE_PACKAGE_OVERLAYS := device/htc/bravo/overlay

# Propreties
PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240 \
    rild.libpath=/system/lib/libhtc_ril.so \
    ro.ril.ecc.HTC-ELL=92,93,94 \
    ro.ril.ecc.HTC-WWE=999 \
    ro.ril.enable.a52.HTC-ITA=1 \
    ro.ril.enable.a53.HTC-ITA=1 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.enable.dtm=1 \
    ro.ril.gprsclass=12 \
    ro.ril.hsdpa.category=8 \
    ro.ril.hsupa.category=5 \
    ro.ril.hsxpa=2 \
    ro.ril.def.agps.mode=2 \
    ro.ril.disable.power.collapse=0 \
    windowsmgr.max_events_per_sec=120 \
    mobiledata.interfaces=rmnet0,rmnet1,rmnet2 \
    ro.media.dec.jpeg.memcap=20000000 \
    ro.opengles.version=131072 \
    ro.telephony.default_network=3 \
    ro.ril.enable.prl.recognition=1 \
    ro.ril.enable.managed.roaming=1 \
    ro.ril.oem.nosim.ecclist=911,112,999,000,08,118,120,122,110,119,995 \
    ro.ril.emc.mode=2 \
    ro.telephony.ril.v3=signalstrengthgsm,singlepdp,apptypesim \
    ro.vold.umsdirtyratio=20 \
    debug.qctwa.statusbar=1 \
    debug.qc.hardware=true \
    debug.qctwa.preservebuf=1

# Set usb type
ADDITIONAL_DEFAULT_PROPERTIES += \
    persist.sys.usb.config=mass_storage \
    persist.service.adb.enable=1

#
# Packages required for bravo
#

# Sensors
PRODUCT_PACKAGES += \
    gps.bravo \
    lights.bravo \
    sensors.bravo

# Ramdisk
PRODUCT_COPY_FILES += \
    device/htc/bravo/init.bravo.rc:root/init.bravo.rc \
    device/htc/bravo/init.bravo.usb.rc:root/init.bravo.usb.rc \
    device/htc/bravo/ueventd.bravo.rc:root/ueventd.bravo.rc

# Prebuilt files/configs
PRODUCT_COPY_FILES += \
    device/htc/bravo/bravo-keypad.kl:system/usr/keylayout/bravo-keypad.kl \
    device/htc/bravo/bravo-keypad.kcm:system/usr/keychars/bravo-keypad.kcm \
    device/htc/bravo/curcial-oj.idc:system/usr/idc/curcial-oj.idc \
    device/htc/bravo/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/bravo/h2w_headset.kcm:system/usr/keychars/h2w_headset.kcm \
    device/htc/bravo/synaptics-rmi-touchscreen.idc:system/usr/idc/synaptics-rmi-touchscreen.idc \
    device/htc/bravo/synaptics-rmi-touchscreen.kl:system/usr/keylayout/synaptics-rmi-touchscreen.kl \
    device/htc/bravo/synaptics-rmi-touchscreen.kcm:system/usr/keychars/synaptics-rmi-touchscreen.kcm \
    device/htc/bravo/vold.fstab:system/etc/vold.fstab \
    device/htc/bravo/sysctl.conf:system/etc/sysctl.conf \
    device/htc/bravo/hostapd:system/bin/hostapd \
    device/htc/bravo/hostapd_cli:system/bin/hostapd_cli


# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/bravo/media_profiles.xml:system/etc/media_profiles.xml

# Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/bravo/bravo-vendor.mk)

# English locale
PRODUCT_LOCALES := en

# High Density art
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Configs
PRODUCT_COPY_FILES += \
    device/htc/bravo/media_codecs.xml:system/etc/media_codecs.xml \
    device/htc/bravo/audio_policy.conf:system/etc/audio_policy.conf

# Misc
PRODUCT_COPY_FILES += \
    device/htc/bravo/init.power.rc:root/init.power.rc

#
# Required Packages
#

# Audio
PRODUCT_PACKAGES += \
    audio.usb.default \
    audio.a2dp.default \
    audio.primary.qsd8k \
    audio_policy.qsd8k

# Camera
PRODUCT_PACKAGES += \
    camera.qsd8k

# Display
PRODUCT_PACKAGES += \
    copybit.qsd8k \
    gralloc.qsd8k \
    hwcomposer.qsd8k

# Omx
PRODUCT_PACKAGES += \
    libOmxCore \
    libOmxVdec \
    libstagefrighthw \
    libOmxVidEnc

# Filesystem management tools
PRODUCT_PACKAGES += \
    make_ext4fs \
    setup_fs

# Misc
PRODUCT_PACKAGES += \
    power.qsd8k \
    com.android.future.usb.accessory

#
# Hardware Rendering Properties
#

PRODUCT_PROPERTY_OVERRIDES += \
    debug.sf.hw=1 \
    debug.hwc.fakevsync=1 \
    debug.composition.type=gpu \
    debug.gr.numframebuffers=2 \
    debug.egl.hw=1 \
    debug.mdpcomp.maxlayer=0

#
# Dalvik Properties
#

# dexop-flags: "v=" n|r|a, "o=" n|v|a|f, "m=y" register map
# v=verify o=optimize: n=none r=remote a=all f=full v=verified
PRODUCT_PROPERTY_OVERRIDES += \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    dalvik.vm.checkjni=false

# Default heap settings for 512mb device
include frameworks/native/build/phone-hdpi-512-dalvik-heap.mk

# We have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

#
# Camera (video recording)
#

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    debug.camcorder.disablemeta=1 \
    rw.media.record.hasb=0

#
# Wifi
#

# Firmware
$(call inherit-product-if-exists, hardware/broadcom/wlan/bcmdhd/firmware/bcm4329/device-bcm.mk)

# Properties
PRODUCT_PROPERTY_OVERRIDES += \
    wifi.interface=wlan0 \
    wifi.supplicant_scan_interval=45

#
# Qcom
#

# Init post-boot script
PRODUCT_COPY_FILES += \
    device/htc/bravo/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh

#
# Permissions
#

PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distict.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Proprietary blobs
$(call inherit-product-if-exists, vendor/htc/qsd8k-common/qsd8k-vendor.mk)
