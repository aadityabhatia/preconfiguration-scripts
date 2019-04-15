#!/bin/bash
set -ve

mkdir -p /etc/opt/chrome/policies/{recommended,managed}

tee /etc/opt/chrome/policies/recommended/geolocation-off.json <<< '{"DefaultGeolocationSetting": 2}'
tee /etc/opt/chrome/policies/recommended/audio-capture-off.json <<< '{"AudioCaptureAllowed": false}'
tee /etc/opt/chrome/policies/recommended/background-mode-off.json <<< '{"BackgroundModeEnabled": false}'
tee /etc/opt/chrome/policies/recommended/network-prediction-off.json <<< '{"NetworkPredictionOptions": 2}'
tee /etc/opt/chrome/policies/recommended/safe-browsing-reporting-off.json <<< '{"SafeBrowsingExtendedReportingEnabled": false}'
tee /etc/opt/chrome/policies/recommended/metrics-reporting-off.json <<< '{"MetricsReportingEnabled": false}'

# argument 1: extension to force-install; takes exactly one item; optional
if [ -n "$1" ]; then
	printf '{"ExtensionInstallForcelist": ["%s"]}' "$1" | tee /etc/opt/chrome/policies/managed/extensions.json;
fi

# success
