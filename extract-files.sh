#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2021 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

set -e

DEVICE=common
VENDOR=gms

# Load extract_utils and do some sanity checks
MY_DIR="${BASH_SOURCE%/*}"
if [[ ! -d "${MY_DIR}" ]]; then MY_DIR="${PWD}"; fi

ANDROID_ROOT="${MY_DIR}/../.."

HELPER="${ANDROID_ROOT}/tools/extract-utils/extract_utils.sh"
if [ ! -f "${HELPER}" ]; then
    echo "Unable to find helper script at ${HELPER}"
    exit 1
fi
source "${HELPER}"

# Default to sanitizing the vendor folder before extraction
CLEAN_VENDOR=true

KANG=
SECTION=

while [ "${#}" -gt 0 ]; do
    case "${1}" in
        -n | --no-cleanup )
                CLEAN_VENDOR=false
                ;;
        -k | --kang )
                KANG="--kang"
                ;;
        -s | --section )
                SECTION="${2}"; shift
                CLEAN_VENDOR=false
                ;;
        * )
                SRC="${1}"
                ;;
    esac
    shift
done

if [ -z "${SRC}" ]; then
    SRC="adb"
fi

function blob_fixup() {
    case "${1}" in
        system/priv-app/GoogleExtServices/GoogleExtServices.apk)
            touch "${2}"
            ;;
    esac
}

if [ -z "$SRC" ]; then
    echo "Path to system dump not specified! Specify one with --path"
    exit 1
fi

# Initialize the helper
setup_vendor "${DEVICE}" "${VENDOR}" "${ANDROID_ROOT}" false "${CLEAN_VENDOR}"

extract "${MY_DIR}/proprietary-files.txt" "${SRC}" "${KANG}" --section "${SECTION}"

source_product_name=$(cat "${SRC}"/product/etc/build.prop | grep ro.product.product.name | sed 's|=| |' | awk '{print $2}')
source_build_id=$(cat "${SRC}"/product/etc/build.prop | grep ro.product.build.id | sed 's|=| |' | awk '{print $2}')
sed -i "s|# All unpinned files are extracted from.*|# All unpinned files are extracted from ${source_product_name} ${source_build_id}|" "${MY_DIR}/proprietary-files.txt"

"${MY_DIR}/setup-makefiles.sh"

# Update PixelSetupWizardStringsOverlay
#"${MY_DIR}/tools/update_PixelSetupWizardStringsOverlay.sh" "${MY_DIR}/common/proprietary/system_ext/priv-app/PixelSetupWizard/PixelSetupWizard.apk"
