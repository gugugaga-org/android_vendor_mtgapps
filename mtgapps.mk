# TPM312 LineageOS 23.2 development component.
# Android TV GApps remain controlled exclusively by WITH_GMS and
# vendor/gapps_tv. This component installs the KernelSU Manager and the JNI
# libraries required beside the AndroidMediaShell APK on the read-only product.

PRODUCT_PACKAGES += KernelSUManager

PRODUCT_PACKAGES += \
    androidmediashell_jni_cast_assistant_1_0 \
    androidmediashell_jni_crashpad_handler_trampoline \
    androidmediashell_jni_cast_shell_android \
    androidmediashell_jni_cast_external_audio_pipeline_1_0 \
    androidmediashell_jni_cast_bluetooth_2_0 \
    androidmediashell_jni_crashpad_handler
