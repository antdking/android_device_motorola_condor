## Specify phone tech before including full_phone
$(call inherit-product, vendor/slim/config/gsm.mk)

# Inherit some common Slim stuff.
$(call inherit-product, vendor/slim/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/motorola/condor/full_condor.mk)

## Device identifier. This must come after all inclusions
PRODUCT_NAME := slim_condor
PRODUCT_RELEASE_NAME := condor
