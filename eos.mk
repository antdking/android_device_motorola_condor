# inherit from the EOS vendor, if present
$(call inherit-product-if-exists, vendor/eos/config/common_full_phone.mk)

PRODUCT_COPY_FILES += \
    vendor/eos/prebuilt/common/bootanimation/720.zip:system/media/bootanimation.zip
