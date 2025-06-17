# Inherit GMS
$(call inherit-product, vendor/partner-gms/gms/gms-vendor.mk)

# Build Split GMS
$(call inherit-product, vendor/partner-gms/custom-gms/setup-custom-gms.mk)

