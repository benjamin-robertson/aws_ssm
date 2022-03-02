#!/bin/sh

echo "my token is"
echo $PT_token

activation_code=`/usr/local/bin/aws-get | grep Value | awk '{ print $36 }' | sed 's/\\n\\nActivation//'`
echo "my activation code is $activation_code" 

activation_id=`/usr/local/bin/aws-get | grep Value | awk '{ print $38 }'`
echo "my activation id is $activation_id"