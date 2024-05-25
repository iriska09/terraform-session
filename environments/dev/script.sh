!/bin/bash


read -p " what is your envoirnment ?, Options [ dev,qa,stage,prod]: " environment 
read -p " What is your Action?, Options [ apply or destroy ] : " action
perl -pi -e "s/dev/${new_name}/g" backend.tf


terraform init -reconfigure
terraform plan -var-file=configs/${environment}.tfvars
terraform fmt 
terraform validate 
terraform desstory

if [ ${action} == "apply" ]; then
terraform apply -var-file=configs/${environment}.tfvars --auto-approve
elif [ ${action} == "destroy" ]; then
terraform destroy -var-file=configs/${environment}.tfvars --auto-approve
fi


perl -pi -e "s/${environment}/_env_/g" backend.tf





