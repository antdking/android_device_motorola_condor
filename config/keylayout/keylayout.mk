$(call inherit-product, device/motorola/msm8610-common/config/keylayout/keylayout.mk)

LOCAL_PATH := device/motorola/condor/config/keylayout
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/qpnp_pon.kl:system/usr/keylayout/qpnp_pon.kl