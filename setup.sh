#!/bin/bash

#==== Install TF, init configs
source "./lib/init_centos_host.sh"

#==== Prepare script to initialize the Ansible container
source "./lib/init_centos_container.sh"

#==== Read the configs and prepare the plans
terraform plan -out plan/ansible.tf.plan config/

#==== Apply the plan
terraform apply plan/ansible.tf.plan

#==== Monitoring
#==== terraform show
docker ps
