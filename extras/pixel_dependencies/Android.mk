LOCAL_PATH := $(call my-dir)

ifneq ($(filter blueline crosshatch bonito sargo flame coral sunfish bramble barbet redfin oriole raven bluejay panther cheetah, $(TARGET_DEVICE)),)
include $(CLEAR_VARS)
LOCAL_RRO_THEME := PixelDependencies
LOCAL_PACKAGE_NAME := PixelDependencies
LOCAL_PRODUCT_MODULE := true

ifneq ($(filter flame coral sunfish bramble barbet redfin oriole raven panther cheetah, $(TARGET_DEVICE)),)
LOCAL_REQUIRED_MODULES += \
    adaptivecharging \
    GoogleCamera_6gb_or_more_ram \
    NgaResources \
    nga
endif

ifneq ($(filter bonito sargo flame coral sunfish bramble barbet redfin oriole raven bluejay panther cheetah, $(TARGET_DEVICE)),)
LOCAL_REQUIRED_MODULES += \
    GoogleCamera
endif

ifneq ($(filter blueline crosshatch flame coral redfin oriole raven panther cheetah, $(TARGET_DEVICE)),)
LOCAL_REQUIRED_MODULES += \
    dreamliner \
    DreamlinerPrebuilt \
    DreamlinerUpdater \
    com.google.android.apps.dreamliner
endif

LOCAL_UNINSTALLABLE_MODULE := true
LOCAL_SDK_VERSION := current
include $(BUILD_RRO_PACKAGE)
endif
