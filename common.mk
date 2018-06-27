# Copyright (C) 2017 The Lineage Project
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

LOCAL_PATH := device/samsung/scx35-common

# Inherit from AOSP product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from sprd-common device configuration
$(call inherit-product, device/samsung/sprd-common/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay
DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay-lineage

# Audio
PRODUCT_PACKAGES += \
	audio_hw.xml \
	audio_para \
	audio_effects_vendor.conf \
	audio_policy.conf \
	codec_pga.xml \
	tiny_hw.xml \
	audio.primary.sc8830 \
	libaudio-resampler

# Bluetooth
PRODUCT_PACKAGES += \
	libbluetooth_jni \
	bluetooth.default \
	libbt-vendor

# Codecs
PRODUCT_PACKAGES += \
	libcolorformat_switcher \
	libstagefrighthw \
	libstagefright_sprd_mpeg4dec \
	libstagefright_sprd_mpeg4enc \
	libstagefright_sprd_h264dec \
	libstagefright_sprd_h264enc \
	libstagefright_sprd_vpxdec \
	libstagefright_sprd_aacdec \
	libstagefright_sprd_mp3dec

# Media config
PRODUCT_PACKAGES += \
	media_codecs.xml

MEDIA_XML_CONFIGS := \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(MEDIA_XML_CONFIGS),$(f):$(TARGET_COPY_OUT_VENDOR)/etc/$(notdir $(f)))

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/system/etc/init/android.hardware.media.omx@1.0-service.rc:$(TARGET_COPY_OUT_VENDOR)/etc/init/android.hardware.media.omx@1.0-service.rc \
	$(LOCAL_PATH)/system/etc/init/mediaserver.rc:$(TARGET_COPY_OUT_SYSTEM)/etc/init/mediaserver.rc

# Common libs
PRODUCT_PACKAGES += \
	libstlport \
	librilutils \
	libril_shim \
	libgps_shim

# GPS
PRODUCT_PACKAGES += \
	libgpspc \
	libefuse \
	gps.conf \
	gps.xml

# HWC
PRODUCT_PACKAGES += \
	libHWCUtils \
	gralloc.sc8830 \
	libmemoryheapion \
	libion_sprd

# System init.rc files
PRODUCT_PACKAGES += \
	at_distributor.rc \
	chown_service.rc \
	data.rc \
	dns.rc \
	engpc.rc \
	gpsd.rc \
	kill_phone.rc \
	macloader.rc \
	modem_control.rc \
	modemd.rc \
	nvitemd.rc \
	phoneserver.rc \
	refnotify.rc \
	set_mac.rc \
	smd_symlink.rc \
	swap.rc \
	wpa_supplicant.rc

# Rootdir files
PRODUCT_PACKAGES += \
	init.board.rc \
	init.wifi.rc \
	init.sc8830.rc \
	init.sc8830.usb.rc \
	ueventd.sc8830.rc

# Packages
PRODUCT_PACKAGES += \
	Jelly

# Lights
PRODUCT_PACKAGES += \
	lights.sc8830

# PowerHAL
#PRODUCT_PACKAGES += \
#	power.sc8830

# Camera config
PRODUCT_PROPERTY_OVERRIDES += \
	camera.disable_zsl_mode=1

# Languages
PRODUCT_PROPERTY_OVERRIDES += \
	ro.product.locale.language=en \
	ro.product.locale.region=GB

# Wifi
PRODUCT_PACKAGES += \
	macloader \
	libandroid_net \
	libwpa_client \
	wificond \
	wifilogd \
	wpa_supplicant.conf \
	wpa_supplicant_overlay.conf \
	p2p_supplicant_overlay.conf

# Disable mobile data on first boot
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.android.mobiledata=false

# Disable treble OMX
PRODUCT_PROPERTY_OVERRIDES += \
	persist.media.treble_omx=false

# ART device props
PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.dex2oat-flags=--no-watch-dog

# HIDL (HAL Interface Definition Language)
PRODUCT_PACKAGES += \
	android.hardware.audio@2.0-impl \
	android.hardware.audio.effect@2.0-impl \
	android.hardware.bluetooth@1.0-impl \
	android.hardware.broadcastradio@1.0-impl \
	android.hardware.camera.provider@2.4-impl-legacy \
	android.hardware.configstore@1.0-impl \
	android.hardware.drm@1.0-impl \
	android.hardware.gnss@1.0-impl \
	android.hardware.graphics.mapper@2.0-impl \
	android.hardware.keymaster@3.0-impl \
	android.hardware.light@2.0-impl \
	android.hardware.memtrack@1.0-impl \
	android.hardware.radio@1.0 \
	android.hardware.radio.deprecated@1.0 \
	android.hardware.renderscript@1.0-impl \
	android.hardware.sensors@1.0-impl \
	android.hardware.usb@1.0-service \
	android.hardware.vibrator@1.0-impl \
	android.hardware.wifi@1.0-service \
	android.system.net.netd@1.0 \
 	camera.device@1.0-impl-legacy

# Permissions
PERMISSIONS_XML_FILES := \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.software.midi.xml \
	packages/wallpapers/LivePicker/android.software.live_wallpaper.xml

PRODUCT_COPY_FILES += \
	$(foreach f,$(PERMISSIONS_XML_FILES),$(f):$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/$(notdir $(f)))

# enable Google-specific location features,
# like NetworkLocationProvider and LocationCollector
PRODUCT_PROPERTY_OVERRIDES += \
	ro.com.google.locationfeatures=1 \
	ro.com.google.networklocation=1

# sdcardfs
PRODUCT_PROPERTY_OVERRIDES += \
	ro.sys.sdcardfs=false

# Dalvik heap config
$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

# For userdebug builds
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
	ro.secure=0 \
	ro.adb.secure=0 \
	ro.debuggable=1 \
	persist.sys.root_access=1 \
	persist.service.adb.enable=1

PRODUCT_PROPERTY_OVERRIDES += \
	persist.sys.usb.config=mtp,adb

# Android Go
$(call inherit-product, build/target/product/go_defaults_512.mk)
