#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Display
TARGET_DISPLAY_ENABLE_DRM := true

# Inherit from generic
$(call inherit-product, device/linux/generic-common/generic.mk)

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Boot animation
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440

# Setup dalvik vm configs
$(call inherit-product, frameworks/native/build/phone-xhdpi-2048-dalvik-heap.mk)

# Include prebuilt kernel
$(call inherit-product-if-exists, device/msft/talkman-kernel/kernel.mk)

# Rootdir
PRODUCT_PACKAGES += \
    fstab.generic \
    fstab.generic_ramdisk \
    init.device.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(LOCAL_PATH)
