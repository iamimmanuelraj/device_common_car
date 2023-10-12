# Car init.rc
PRODUCT_COPY_FILES += \
    packages/services/Car/car_product/init/init.bootstat.rc:root/init.bootstat.rc \
    packages/services/Car/car_product/init/init.car.rc:root/init.car.rc

# Hidl
PRODUCT_PACKAGES += \
    android.hardware.automotive.vehicle@2.0-service \
    android.hardware.automotive.audiocontrol@1.0-service