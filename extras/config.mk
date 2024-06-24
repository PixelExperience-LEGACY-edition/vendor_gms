# Recorder
ifeq ($(TARGET_SUPPORTS_GOOGLE_RECORDER), true)
PRODUCT_PACKAGES += \
    RecorderPrebuilt
endif

# arcore
ifeq ($(TARGET_INCLUDE_STOCK_ARCORE),true)
PRODUCT_PACKAGES += \
    arcore
endif

# Live Wallpapers
ifeq ($(TARGET_INCLUDE_LIVE_WALLPAPERS),true)
PRODUCT_PACKAGES += \
    PixelLiveWallpaperPrebuilt
endif

# Quick Tap
ifeq ($(TARGET_SUPPORTS_QUICK_TAP),true)
PRODUCT_PACKAGES += \
    quick_tap
endif

# Call recording on Google Dialer
ifeq ($(TARGET_SUPPORTS_CALL_RECORDING),true)
PRODUCT_PACKAGES += \
    com.google.android.apps.dialer.call_recording_audio.features
endif

# TurboAdapter
PRODUCT_PACKAGES += \
    TurboAdapter

# Pixel Dependencies
PRODUCT_PACKAGES += \
    PixelDependencies

# Wallpapers
PRODUCT_PACKAGES += \
    WallpaperEmojiPrebuilt