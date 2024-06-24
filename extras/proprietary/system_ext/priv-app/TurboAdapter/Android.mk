LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE := TurboAdapter
LOCAL_MODULE_TAGS := optional
ifneq ($(filter blueline crosshatch bonito sargo flame coral sunfish bramble redfin oriole raven bluejay panther cheetah, $(TARGET_DEVICE)),)
LOCAL_SRC_FILES := TurboAdapter.apk
else
LOCAL_SRC_FILES := TurboAdapter_NoBatt.apk
endif
LOCAL_CERTIFICATE := platform
LOCAL_MODULE_CLASS := APPS
LOCAL_SYSTEM_EXT_MODULE := true
LOCAL_PRIVILEGED_MODULE := true
LOCAL_REQUIRED_MODULES := libpowerstatshaldataprovider
LOCAL_MODULE_SUFFIX := $(COMMON_ANDROID_PACKAGE_SUFFIX)
LOCAL_ENFORCE_USES_LIBRARIES := false
LOCAL_DEX_PREOPT := false
include $(BUILD_PREBUILT)

LIBPOWERSTATS_SYMLINK := $(TARGET_OUT_SYSTEM_EXT)/priv-app/TurboAdapter/lib/arm64/libpowerstatshaldataprovider.so
$(LIBPOWERSTATS_SYMLINK): $(LOCAL_INSTALLED_MODULE)
	@echo "libpowerstatshaldataprovider link: $@"
	@mkdir -p $(dir $@)
	@rm -rf $@
	$(hide) ln -sf /system_ext/lib64/libpowerstatshaldataprovider.so $@

ALL_DEFAULT_INSTALLED_MODULES += $(LIBPOWERSTATS_SYMLINK)