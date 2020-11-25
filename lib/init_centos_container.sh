#!/bin/bash

# This will be run inside the Ansible container
#   Install ansible and load playbooks, roles..
cat <<EOF > ansible_setup.sh
#!/bin/bash
yum -y install epel-release
yum -y update
yum -y install ansible-2.9.15

EOF
