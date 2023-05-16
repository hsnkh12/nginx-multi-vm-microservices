# nginx-multi-vm-microservices

## Getting Started
To get started with the multi-VM environment, follow these steps:

- Clone this repository to your local machine.

- Open a terminal and navigate to the repository's root directory.

- Run the following command to start provisioning the VMs:

```
vagrant up
```

- This command will start creating and provisioning the VMs based on the configuration specified in the Vagrantfile.

- Wait for the provisioning process to complete. Vagrant will automatically download the base box images if they are not already present on your machine.

- Once the VMs are up and running, you can SSH into any of them using the following command:

```
vagrant ssh <vm-name>
```
Replace <vm-name> with the name of the desired VM (apigateway, web01, or web02).

## VM Configuration
  
 This Vagrant configuration sets up the following three VMs:

### VM 1: apigateway
Box: ubuntu/trusty64
Hostname: apigateway
IP Address: 192.168.33.1
Memory: 512MB
CPUs: 2
  
### VM 2: web01
Box: ubuntu/trusty64
Hostname: web01
IP Address: 192.168.33.2
Memory: 1024MB
CPUs: 2
  
### VM 3: web02
Box: ubuntu/trusty64
Hostname: web02
IP Address: 192.168.33.2
Memory: 1024MB
CPUs: 2
  
## Provisioning
Each VM is provisioned using shell scripts located in the provisions directory. The scripts are executed in the order specified in the Vagrantfile for each VM. The provisioning process includes an initial setup script (default_setup.sh) followed by VM-specific setup scripts (api_gateway_setup.sh, web01_setup.sh, and web02_setup.sh).

You can modify the provisioning scripts to customize the setup according to your requirements.


