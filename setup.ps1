
$PSVersionTable

terraform plan -out .\plans\01_azure_build_infra.tf
terraform apply     .\plans\01_azure_build_infra.tf

terraform plan -out .\plans\02_ansible_deploy.tf
terraform apply     .\plans\02_ansible_deploy.tf

terraform plan -out .\plans\03_vm_hardening.tf
terraform apply     .\plans\03_vm_hardening.tf