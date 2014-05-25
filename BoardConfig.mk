#
# Copyright (C) 2014 The CyanogenMod Project
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

#
# This file sets variables that control the way modules are built
# thorughout the system. It should not be used to conditionally
# disable makefiles (the proper mechanism to control what gets
# included in a build is to use PRODUCT_PACKAGES in a product
# definition file).
#

-include device/motorola/msm8610-common/BoardConfigCommon.mk

# inherit from the proprietary version
-include vendor/motorola/condor/BoardConfigVendor.mk

LOCAL_PATH := device/motorola/condor

#bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

# Assert
TARGET_OTA_ASSERT_DEVICE := xt1021,xt1022,xt1025,condor_umts,condor

#TWRP
DEVICE_RESOLUTION := 540x960
TW_IGNORE_MAJOR_AXIS_0 := true
BOARD_HAS_NO_REAL_SDCARD :=
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_EXCLUDE_SUPERSU := true

# userdata 4GB
BOARD_USERDATAIMAGE_PARTITION_SIZE := 4294967296