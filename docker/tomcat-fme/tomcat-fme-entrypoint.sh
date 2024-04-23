#!/usr/bin/env bash

set -e

# Opt-in is only activated if the environment variable is set
if [ -n "$FME_LIC_SERVER" ] && [ -n "$FME_LIC_TYPE" ]; then
    echo " "
    echo " / _|_ __ ___   ___    _  | |_ ___  _ __ ___   ___ __ _| |_      .:::.:::."
    echo "| |_|  _   _ \ / _ \ _| |_| __/ _ \|  _   _ \ / __/ _  | __| ___ :::::::::"
    echo "|  _| | | | | |  __/|_   _| || (_) | | | | | | (_| (_| | |_| ___  ':::::' "
    echo "|_| |_| |_| |_|\___|  |_|  \__\___/|_| |_| |_|\___\__,_|\__|        ':'   "
    echo " "
    echo "Using a license server"
    echo "FLEXlm License server : $FME_LIC_SERVER"
    echo "FME License type : $FME_LIC_TYPE"
    echo " "
    echo "Query FLEXlm license server (fmelicensingassistant --query) ..."
    fmelicensingassistant --query "$FME_LIC_SERVER"
    echo " "
    echo "Getting FME License using the FLEXlm Server with (fmelicensingassistant --floating) ..."
    fmelicensingassistant --floating "$FME_LIC_SERVER" "$FME_LIC_TYPE"
else
    echo "BAD NEWS EVERYONE !"
    echo "This only works with a FME FLEXlm Server, specify env variables : FME_LIC_SERVER and FME_LIC_TYPE"
    exit 99
fi

exec "$@"
