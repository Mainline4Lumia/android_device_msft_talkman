#
# Copyright (C) 2023 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

# Inherit from talkman device
$(call inherit-product, device/msft/talkman/device.mk)

PRODUCT_NAME := lineage_talkman
PRODUCT_DEVICE := talkman
PRODUCT_MANUFACTURER := Microsoft
PRODUCT_BRAND := Microsoft
PRODUCT_MODEL := Lumia 950
