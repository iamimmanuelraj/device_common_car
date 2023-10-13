# Car Configs
PRODUCT_COPY_FILES += \
    device/generic/car/common/config.ini:config.ini

# Car init.rc
PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/init/init.bootstat.rc:root/init.bootstat.rc \
    packages/services/Car/car_product/init/init.car.rc:root/init.car.rc

# Hidl
ifeq (true,$(call math_gt,$(PLATFORM_SDK_VERSION),29))
PRODUCT_PACKAGES += \
    android.hardware.automotive.audiocontrol@2.0-service \
    android.frameworks.automotive.display@1.0-service \
    Vehicle
else
PRODUCT_PACKAGES += \
    android.hardware.automotive.audiocontrol@1.0-service
endif

ifneq (true,$(call math_gt_or_eq,$(PLATFORM_SDK_VERSION),29))
PRODUCT_PACKAGES += \
    android.hardware.bluetooth@1.0-service.sim
endif

PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@2.0-service \
	android.hardware.broadcastradio@2.0-service

# Multi-user properties
PRODUCT_SYSTEM_DEFAULT_PROPERTIES := \
    android.car.number_pre_created_users=1 \
    android.car.number_pre_created_guests=1

ifeq (true,$(call math_gt,$(PLATFORM_SDK_VERSION),29))
PRODUCT_SYSTEM_DEFAULT_PROPERTIES := \
    android.car.user_hal_enabled=true
endif

# Landscape Mode
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.screen.landscape.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/permissions/android.hardware.screen.landscape.xml

# Overlays
PRODUCT_PACKAGE_OVERLAYS := $(LOCAL_PATH)/overlay

# Permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.type.automotive.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.type.automotive.xml \
    frameworks/native/data/etc/android.hardware.wifi.passpoint.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.wifi.passpoint.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.broadcastradio.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.broadcastradio.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/common/cofigs/car_core_hardware.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/car_core_hardware.xml

# Product makefiles
$(call inherit-product, packages/services/Car/car_product/build/car.mk)

# Secondary Display
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.activities_on_secondary_displays.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.activities_on_secondary_displays.xml

# Sepolicy
BOARD_SEPOLICY_DIRS += device/generic/car/common/sepolicy

# Whitelisted Packages
ifeq (true,$(call math_gt,$(PLATFORM_SDK_VERSION),29))
PRODUCT_COPY_FILES += \
    device/generic/car/common/preinstalled-packages-product-car-emulator.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-product-car-emulator.xml
endif