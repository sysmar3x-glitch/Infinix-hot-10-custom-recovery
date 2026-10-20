# Inherit 64-bit architecture and core configurations
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)
$(call inherit-product, vendor/twrp/config/common.mk)

DEVICE_PATH := device/infinix/X682C

# Device Identifiers (Matched to x682c_h694)
PRODUCT_DEVICE := X682C
PRODUCT_NAME := twrp_X682C
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix Hot 10
PRODUCT_MANUFACTURER := Infinix

# Dynamic Partition Support
PRODUCT_USE_DYNAMIC_PARTITIONS := true

# Fastbootd, Decryption & Core Recovery Packages
PRODUCT_PACKAGES += \
    android.hardware.fastboot@1.0-impl-mock \
    fastbootd \
    keystore_auth \
    resetprop \
    toolbox \
    toybox

# Merge Recovery, Crypto & ADB Properties cleanly into generated prop.default
PRODUCT_PROPERTY_OVERRIDES += \
    ro.hardware=mt6768 \
    ro.hardware.kmsetkey=mt6768 \
    ro.hardware.gatekeeper=mt6768 \
    ro.debuggable=1 \
    ro.adb.secure=0 \
    ro.secure=0 \
    sys.usb.config=mtp,adb

# Explicitly copy fstab and flags into Recovery Ramdisk
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery.fstab:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/recovery.fstab \
    $(DEVICE_PATH)/twrp.flags:$(TARGET_COPY_OUT_RECOVERY)/root/system/etc/twrp.flags
