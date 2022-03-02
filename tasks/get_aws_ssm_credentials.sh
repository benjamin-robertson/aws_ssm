#!/bin/sh

echo "my token is"
echo $PT_token

activation_code = $(/usr/local/bin/aws-get | grep Value | awk '{ print $36 }' | sed 's/\\n\\nActivation//')
echo "my activation code is"
echo $activation_code
