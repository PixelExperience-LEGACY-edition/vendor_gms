#!/bin/bash
#
# Copyright (C) 2021-2022 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEBUG=0
if [[ ${DEBUG} != 0 ]]; then
    log="/dev/tty"
else
    log="/dev/null"
fi

if [[ -z "${1}" ]]; then
    echo "Usage: bash update_PixelSetupWizardStringsOverlay.sh /path/to/PixelSetupWizard.apk"
    exit
fi

if [[ ! -f "${1}" ]]; then
    echo "Can not find a file at '${1}'"
    exit
fi

if [[ ! -d overlay/PixelSetupWizardStringsOverlay ]]; then
    echo "./overlay/PixelSetupWizardStringsOverlay does not exist"
    exit
fi

# Create a temporary working directory
TMPDIR=$(mktemp -d)

apktool d ${1} -o "${TMPDIR}"/out > "${log}"

rm -rf overlay/PixelSetupWizardStringsOverlay/res
for strings in $(find "${TMPDIR}"/out/ -name strings.xml); do
    # If no string contains "Pixel" skip this language
    if [[ -z $(cat "${strings}" | grep "Pixel") ]]; then
        continue
    fi

    target_path=overlay/PixelSetupWizardStringsOverlay/$(echo "${strings}" | sed "s|${TMPDIR}/out/||" | sed "s|/strings.xml||")
    if [[ ! -d "${target_path}" ]]; then
        mkdir -p "${target_path}"
    fi

    touch "${target_path}"/strings.xml
    echo '<?xml version="1.0" encoding="utf-8"?>' >> "${target_path}"/strings.xml
    echo '<resources>' >> "${target_path}"/strings.xml

    # Find all strings including "Pixel" and write them to strings.xml
    for string in $(cat "${strings}" | grep "Pixel" | sed 's/>/ /g' | awk '{print $2}'); do
        echo "    " $(cat "${strings}" | grep "${string}") >> $target_path/strings.xml
    done

    echo '</resources>' >> "${target_path}"/strings.xml

    sed -i "s|Pixel|Android|g" "${target_path}"/strings.xml
done

# Clear the temporary working directory
rm -rf "${TMPDIR}"
