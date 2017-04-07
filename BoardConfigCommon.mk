# Copyright (C) 2017 The Lineage Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit from SPRD common configs
-include device/samsung/sprd-common/BoardConfigCommon.mk

# Platform
TARGET_ARCH := arm
TARGET_BOARD_PLATFORM := sc8830
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
TARGET_CPU_VARIANT := cortex-a7
TARGET_CPU_SMP := true
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_NO_BOOTLOADER := true
BOARD_VENDOR := samsung

# RIL
BOARD_GLOBAL_CFLAGS += -DDISABLE_ASHMEM_TRACKING

# Bluetooth
USE_BLUETOOTH_BCM4343 := true
BOARD_CUSTOM_BT_CONFIG := device/samsung/scx35-common/bluetooth/libbt_vndcfg.txt

# FM radio
BOARD_HAVE_FM_BCM := true

# Graphics
BOARD_EGL_NEEDS_HANDLE_VALUE := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true

# HWComposer
USE_SPRD_HWCOMPOSER := true

# Enable WEBGL in WebKit
ENABLE_WEBGL := true

# Include an expanded selection of fonts
EXTENDED_FONT_FOOTPRINT := true

# Lights
TARGET_HAS_BACKLIT_KEYS := false

# Codecs
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

# Board specific features
TARGET_HAS_LEGACY_CAMERA_HAL1 := true

# healthd
BOARD_HAL_STATIC_LIBRARIES := libhealthd.sc8830

# Use dmalloc() for such low memory devices like us
MALLOC_SVELTE := true
BOARD_USES_LEGACY_MMAP := true

# Bionic
TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS := true

# PowerHAL
TARGET_POWERHAL_VARIANT := scx35

# SELinux
BOARD_SEPOLICY_DIRS += device/samsung/scx35-common/sepolicy

# Init
TARGET_INIT_VENDOR_LIB := libinit_sec

# Enable dex-preoptimization to speed up the first boot sequence
#WITH_DEXPREOPT := true
#WITH_DEXPREOPT_PIC := true
#WITH_DEXPREOPT_COMP := false

# Charger
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_NO_CHARGER_LED := true
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/power_supply/battery/batt_lp_charging
CHARGING_ENABLED_PATH := /sys/class/power_supply/battery/batt_lp_charging
BACKLIGHT_PATH := /sys/class/backlight/panel/brightness

# Build system
WITHOUT_CHECK_API := true
