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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from condor device
$(call inherit-product, device/motorola/condor/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := condor
PRODUCT_NAME := full_condor
PRODUCT_BRAND := motorola
PRODUCT_MODEL := condor
PRODUCT_MANUFACTURER := motorola

# hack to allow for unification
ifeq (exists, $(shell test -d $(TOP)/vendor/eos && echo exists))
  $(call inherit-product, device/motorola/condor/eos.mk)
endif
