# Android TV application vendor package

This repository contains the official KernelSU Manager prebuilt and the
makefile integration needed by the TPM312 LineageOS 21 product. Android TV
GApps are provided separately by MindTheGapps through `vendor/gapps_tv` and
the standard `WITH_GMS` switch.

The APKs and their accompanying resources are third-party materials. Their
license and redistribution terms are determined by their respective vendors;
review those terms before redistributing or shipping an image that includes
them.

The KernelSU Manager APK is a development component. It does not provide
kernel-side KernelSU support by itself; the device kernel must carry the
KernelSU project and `CONFIG_KSU=y`.
