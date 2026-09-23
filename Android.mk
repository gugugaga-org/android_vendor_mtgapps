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

# AndroidMediaShell is imported by vendor/gapps_tv, so its JNI libraries need
# separate prebuilt shared-library modules. Keep them beside the APK because
# extractNativeLibs=true cannot populate the read-only product partition.
define declare-androidmediashell-jni
include $$(CLEAR_VARS)
LOCAL_MODULE := androidmediashell_jni_$(1)
LOCAL_MODULE_OWNER := mtgapps
LOCAL_SRC_FILES := proprietary/product/priv-app/AndroidMediaShell/lib/arm64-v8a/$(2).so
LOCAL_MODULE_CLASS := SHARED_LIBRARIES
LOCAL_MODULE_SUFFIX := .so
LOCAL_MODULE_STEM := $(2)
LOCAL_MODULE_TAGS := optional
LOCAL_MULTILIB := 64
LOCAL_PRODUCT_MODULE := true
LOCAL_MODULE_PATH := $$(TARGET_OUT_PRODUCT)/priv-app/AndroidMediaShell/lib/arm64
LOCAL_STRIP_MODULE := false
# These app-private JNI libraries load dependencies from the application
# namespace at runtime; the generic prebuilt checker cannot model that namespace.
LOCAL_CHECK_ELF_FILES := false
include $$(BUILD_PREBUILT)
endef

$(eval $(call declare-androidmediashell-jni,cast_assistant_1_0,libcast_assistant_1.0))
$(eval $(call declare-androidmediashell-jni,crashpad_handler_trampoline,libcrashpad_handler_trampoline))
$(eval $(call declare-androidmediashell-jni,cast_shell_android,libcast_shell_android))
$(eval $(call declare-androidmediashell-jni,cast_external_audio_pipeline_1_0,libcast_external_audio_pipeline_1.0))
$(eval $(call declare-androidmediashell-jni,cast_bluetooth_2_0,libcast_bluetooth_2.0))
$(eval $(call declare-androidmediashell-jni,crashpad_handler,libcrashpad_handler))
