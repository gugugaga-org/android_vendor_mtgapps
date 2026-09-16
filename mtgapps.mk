# MindTheGapps ATV 12.1 arm64 (unofficial) - product integration
# Included from device/rockchip/rk3399/rk3399_tpm312/rk3399_tpm312.mk

PRODUCT_PACKAGES += \
    PrebuiltGmsCorePano \
    Tubesky \
    TVLauncher \
    TVRecommendations \
    AndroidMediaShell \
    AtvAxel \
    AtvRemoteService \
    Backdrop \
    GoogleOneTimeInitializer \
    Katniss \
    SssAuthbridgePrebuilt \
    GoogleFeedback \
    GooglePartnerSetup \
    GoogleServicesFramework \
    GooglePackageInstaller \
    GoogleExtShared \
    GoogleCalendarSyncAdapter \
    GoogleTTS \
    talkback \
    MtgATVOverlay

# SetupWraith is only needed for the Google TV first-boot provisioning flow.
# Keep it off in test images; enable with TPM312_ENABLE_SETUPWRAITH=true.
TPM312_ENABLE_SETUPWRAITH ?= false
ifeq ($(TPM312_ENABLE_SETUPWRAITH),true)
PRODUCT_PACKAGES += SetupWraithPrebuilt
endif

# KernelSU is intentionally limited to development images.  The Manager is
# preinstalled as a product priv-app so it is present after a data wipe; the
# kernel crown scan also covers /product/priv-app.
ifneq (,$(filter userdebug eng,$(TARGET_BUILD_VARIANT)))
PRODUCT_PACKAGES += KernelSUManager
endif

PRODUCT_COPY_FILES += \
    vendor/mtgapps/compat/compat_framework_overrides.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/appcompat/compat_framework_overrides.xml \
    vendor/mtgapps/proprietary/product/etc/default-permissions/default-atv-permissions.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/default-permissions/default-atv-permissions.xml \
    vendor/mtgapps/proprietary/product/etc/permissions/privapp-permissions-atv-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-atv-product.xml \
    vendor/mtgapps/proprietary/product/etc/permissions/privapp-permissions-google-p.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-p.xml \
    vendor/mtgapps/proprietary/product/etc/permissions/privapp-permissions-google-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/privapp-permissions-google-product.xml \
    vendor/mtgapps/proprietary/product/etc/permissions/split-permissions-google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/split-permissions-google.xml \
    vendor/mtgapps/proprietary/product/etc/sysconfig/google-hiddenapi-package-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-hiddenapi-package-whitelist.xml \
    vendor/mtgapps/proprietary/product/etc/sysconfig/google-staged-installer-whitelist.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google-staged-installer-whitelist.xml \
    vendor/mtgapps/proprietary/product/etc/sysconfig/google.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google.xml \
    vendor/mtgapps/proprietary/product/etc/sysconfig/google_atv.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/google_atv.xml \
    vendor/mtgapps/proprietary/system/etc/permissions/privapp-permissions-google-system.xml:system/etc/permissions/privapp-permissions-google-system.xml \
    vendor/mtgapps/proprietary/system_ext/etc/permissions/privapp-permissions-google-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-google-system_ext.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google

# Dev/test only: do not abort boot on a privapp whitelist mismatch.
PRODUCT_PROPERTY_OVERRIDES += \
    ro.control_privapp_permissions=log
