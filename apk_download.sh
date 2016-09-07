#!/usr/bin/env bash

# Download an APK file from a connected USB device.
# Call the script with one argument being the name of an application.
# ./apk_download.sh snapchat

function get_apk_package_name() {
    local full_package_name=$(adb shell pm list packages | grep $find_apk)
    
    echo ${full_package_name##*:} | tr -d '\r'
}

function get_apk_path() {
    local package_name=$(get_apk_package_name)
    local full_apk_path=$(adb shell pm path $package_name)
    
    echo ${full_apk_path##*:} | tr -d '\r'
}

function download_apk() {
    local path=$(get_apk_path)

    adb pull $path
}

if [[ $# -eq 0 ]] ; then
    echo "No arguments supplied"
    exit 1
else
    find_apk="$1"

    download_apk
fi
