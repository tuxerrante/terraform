#!/bin/bash
#================================================
### OS INIT Commands

if ! terraform -v; then
    curl -O -X GET https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
    sudo unzip -q terraform_0.13.5_linux_amd64.zip –d /usr/local/bin
fi

# Login to Docker Hub inside the tf config
docker login

mkdir ansible_volume config plan

terraform 0.13upgrade config
terraform init config/
