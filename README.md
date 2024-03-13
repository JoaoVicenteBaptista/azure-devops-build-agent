# PropAI Infrastructure as Code

## Getting Started
* Create an SSH key to be added to the servers
```
ssh-keygen -f ~/.ssh/<key-name> -t rsa -b 4096 -N ''
```
* Export Hetzner Cloud token as an env variable
Refer to hcloud_token.md
* Create infrastruture with terraform
```
terraform init
terraform apply -auto-approve
```

## SSH'ing to the VMs
ssh -i ~/.ssh/tf_hetzner devops@<host>

## Setting environment variables
### Unix/Linux/MacOS

```
export TF_VAR_hcloud_token="<token>"
```
### Windows Powershell
## Windows Powershell
```
$env:TF_VAR_hcloud_token="<token>"
```

### Reference
* https://medium.com/@orestovyevhen/set-up-infrastructure-in-hetzner-cloud-using-terraform-ce85491e92d

## Grafana Cloud
https://grafana.com/orgs/joaovicentebaptista -> ensure that you're using this URL to create the access policy, instead of the stack instance (https://joaovicentebaptista.grafana.com)
https://grafana.com/docs/grafana-cloud/developer-resources/infrastructure-as-code/terraform/terraform-cloud-stack/ -> provides the roles required to start

Region is US as I can't seem to be able to create an access policy token in europe.