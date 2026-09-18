# TPM312 Lineage 21 vendor package.
#
# This project carries only the official KernelSU Manager prebuilt. Android TV
# GApps are supplied by vendor/gapps_tv and selected through WITH_GMS.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := KernelSUManager
LOCAL_MODULE_OWNER := KernelSU
LOCAL_SRC_FILES := proprietary/product/priv-app/KernelSUManager/KernelSUManager.apk
# Preserve the official v2/v3 signature; the legacy Make prebuilt path would
# otherwise transform the APK while staging it.
LOCAL_REPLACE_PREBUILT_APK_INSTALLED := $(LOCAL_PATH)/proprietary/product/priv-app/KernelSUManager/KernelSUManager.apk
LOCAL_CERTIFICATE := PRESIGNED
LOCAL_MODULE_CLASS := APPS
LOCAL_MODULE_TAGS := optional
LOCAL_PRODUCT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_MODULE_STEM := base
LOCAL_INSTALLED_MODULE_STEM := base.apk
# extractNativeLibs=true: ship JNI beside the APK on the read-only product
# partition so the manager can load its driver libraries at runtime.
LOCAL_PREBUILT_JNI_LIBS_arm64 := \
    proprietary/product/priv-app/KernelSUManager/lib/arm64-v8a/libkernelsu.so \
    proprietary/product/priv-app/KernelSUManager/lib/arm64-v8a/libksud.so \
    proprietary/product/priv-app/KernelSUManager/lib/arm64-v8a/libmagiskboot.so
LOCAL_DEX_PREOPT := false
LOCAL_ENFORCE_USES_LIBRARIES := false
include $(BUILD_PREBUILT)
