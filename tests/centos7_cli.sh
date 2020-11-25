#!/bin/bash

#================================================
### OS INIT Commands
# bash ../lib/initialize_ansible_container
if ! terraform -v; then
    curl -O -X GET https://releases.hashicorp.com/terraform/0.13.5/terraform_0.13.5_linux_amd64.zip
    sudo unzip -q terraform_0.13.5_linux_amd64.zip –d /usr/local/bin
fi

# This will be run inside the Ansible container
#   playbooks, roles..
cat <<EOF > ansible_setup.sh
#!/bin/bash
yum -y install epel-release
yum -y update
yum -y install ansible-2.9.15
EOF

# Login to Docker Hub inside the tf config
docker login

mkdir ansible_volume config plan

terraform 0.13upgrade config
terraform init config/


#================================================
## ----
terraform plan -out plan/ansible.tf.plan config/
terraform apply plan/ansible.tf.plan

terraform show
docker ps
