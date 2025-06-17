# Build custom-gms
PRODUCT_PACKAGES += \
	Photos \
	YouTube \
	PrebuiltGmsCoreSc \
	Velvet

# Permissions for Call recording
PRODUCT_COPY_FILES += \
    vendor/partner-gms/custom-gms/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/com.google.android.apps.dialer.call_recording_audio.features.xml

