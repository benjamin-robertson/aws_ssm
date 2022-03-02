#!/bin/sh
echo "check homedir"
eval echo ~$USER

source /etc/profile.d/test.sh 
export
env

aws help
/usr/bin/aws
which aws
echo "my token is"
echo $PT_token
echo "pe server is"
echo $PT_pe
echo "group ID is"
echo $PT_groupid


# Get activation code, need to find a better way to do this. Possibly updare the aws script in use
activation_code=$(/usr/local/bin/aws-get | grep Value | awk '{ print $36 }' | sed 's/\\n\\nActivation//')
echo "my activation code is $activation_code"

activation_id=$(/usr/local/bin/aws-get | grep Value | awk '{ print $38 }')
echo "my activation id is $activation_id"

# set the varibles for the api call
type_header='Content-Type: application/json'
auth_header="X-Authentication: $PT_token"
uri="https://$PT_pe:4433/classifier-api/v1/groups/$PT_groupid"
data="{\"config_data\": 
          {\"profile::lab::aws_ssm\": {
               \"activation_code\": \"$activation_code\",
               \"activation_id\": \"$activation_id\"}
          }
      }"

# Call the API
curl -k --header "$type_header" --header "$auth_header" --request POST "$uri" --data "$data"