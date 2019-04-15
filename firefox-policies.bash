#!/bin/bash
set -ve

mkdir -p /usr/lib/firefox/distribution/

# argument 1: first-run welcome page; optional
echo $@

tee /usr/lib/firefox/distribution/policies.json <<EOF
{
	"policies": {
		"OverrideFirstRunPage": "$1",
		"Certificates": {
			"ImportEnterpriseRoots": true
		},
		"SecurityDevices" : {
			"CoolKey SmartCard": "/usr/lib/pkcs11/libcoolkeypk11.so",
			"p11-kit System Certificates": "/usr/lib/x86_64-linux-gnu/pkcs11/p11-kit-trust.so"
		},
		"Proxy": {
			"Mode": "system",
			"UseProxyForDNS": true,
			"Locked": false
		},
		"DontCheckDefaultBrowser": true,
		"Camera": {
			"BlockNewRequests": true,
			"Locked": false
		},
		"Microphone": {
			"BlockNewRequests": true,
			"Locked": false
		},
		"Location": {
			"BlockNewRequests": true,
			"Locked": false
		},
		"DisableFirefoxStudies": true,
		"DisablePocket": true,
		"DisableTelemetry": true,
		"EnableTrackingProtection": {
			"Value": true,
			"Locked": false
		},
		"Cookies": {
			"AcceptThirdParty": "never",
			"RejectTracker": true,
			"Locked": false
		}
	}
}
EOF

# success
