#
# Copyright (C) 2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mainline-common
include device/linux/mainline-common/BoardConfigCommon.mk

DEVICE_PATH := device/msft/talkman

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_VARIANT_RUNTIME := cortex-a53

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := generic
TARGET_2ND_CPU_VARIANT_RUNTIME := cortex-a53.a57

# Display
TARGET_SCREEN_DENSITY := 440

# Kernel
BOARD_KERNEL_BASE := 0x00000000
BOARD_KERNEL_CMDLINE := dtb=msm8992-msft-lumia-octagon-talkman.dtb
BOARD_KERNEL_CMDLINE += video=efifb
BOARD_KERNEL_CMDLINE += initrd=initramfs.img root=/dev/ram rw
BOARD_KERNEL_CMDLINE += fbcon=map:2
BOARD_KERNEL_CMDLINE += androidboot.hardware=mainline
BOARD_KERNEL_CMDLINE += loop.max_part=7
# eMMC
BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/f9824900.sdhci
# SDCard
#BOARD_KERNEL_CMDLINE += androidboot.boot_devices=soc/f98a4900.sdhci
BOARD_KERNEL_CMDLINE += androidboot.init_fatal_reboot_target=recovery
BOARD_KERNEL_CMDLINE += androidboot.selinux=permissive
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_INCLUDE_DTB_IN_BOOTIMG := true
BOARD_KERNEL_PAGESIZE := 4096
TARGET_KERNEL_ARCH := arm64
TARGET_KERNEL_CLANG_COMPILE := true
TARGET_KERNEL_SOURCE := kernel/msft/talkman
TARGET_KERNEL_CONFIG := talkman_defconfig
-include device/msft/talkman-kernel/BoardConfigKernel.mk

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 134217728
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_USERDATAIMAGE_PARTITION_SIZE := 5209325568

SSI_PARTITIONS := system
TREBLE_PARTITIONS := vendor
ALL_PARTITIONS := $(SSI_PARTITIONS) $(TREBLE_PARTITIONS)

$(foreach p, $(call to-upper, $(ALL_PARTITIONS)), \
    $(eval BOARD_$(p)IMAGE_FILE_SYSTEM_TYPE := ext4) \
    $(eval TARGET_COPY_OUT_$(p) := $(call to-lower, $(p))))

# Partitions - legacy
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 3145728000
BOARD_VENDORIMAGE_PARTITION_SIZE := 2097152000

# Recovery
TARGET_RECOVERY_FSTAB := $(DEVICE_PATH)/rootdir/etc/fstab.mainline
TARGET_RECOVERY_PIXEL_FORMAT := BGRA_8888
