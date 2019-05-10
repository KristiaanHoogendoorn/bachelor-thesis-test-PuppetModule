#!/bin/bash

status=69

sudo /opt/puppetlabs/bin/puppet apply --modulepath=/home/vagrant/builds/$CI_PROJECT_NAMESPACE/ -e "include ::$CI_PROJECT_NAME" --detailed-exitcodes 

status="$?"

if  [[ "$status" -eq "0" || "$status" -eq "2" ]] ;
then echo "successful"
else echo "exit Code:" $status "FAILED"
false
fi
