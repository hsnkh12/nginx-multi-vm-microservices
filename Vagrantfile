Vagrant.configure("2") do |config|
  config.hostmanager.enabled = true 
  config.hostmanager.manage_host = true
  
### VM 1  ####
config.vm.define "apigateway" do |box|

  box.vm.box = "ubuntu/trusty64"
  box.vm.hostname = "apigateway"
  box.vm.network "private_network", ip: "192.168.33.1"
  box.vm.provider "virtualbox" do |vb|
  vb.memory = "512"
  vb.cpus = "2"
  end
  box.vm.provision "init", run: "once", type: "shell", path: "provisions/default_setup.sh"
  box.vm.provision "nginx", type: "shell", path: "provisions/api_gateway_setup.sh"

end
  
### VM 2 ###
config.vm.define "web01" do |box|

  box.vm.box = "ubuntu/trusty64"
  box.vm.hostname = "web01"
  box.vm.network "private_network", ip: "192.168.33.2"
  box.vm.provider "virtualbox" do |vb|
  vb.memory = "512"
  vb.cpus = "2"
  end
  box.vm.provision "init", run: "once", type: "shell", path: "provisions/default_setup.sh"
  box.vm.provision "web01", type: "shell", path: "provisions/web01_setup.sh"

end


### VM 3 ###
config.vm.define "web02" do |box|

  box.vm.box = "ubuntu/trusty64"
  box.vm.hostname = "web02"
  box.vm.network "private_network", ip: "192.168.33.2"
  box.vm.provider "virtualbox" do |vb|
  vb.memory = "512"
  vb.cpus = "2"
  end
  box.vm.provision "init",run: "once", type: "shell", path: "provisions/default_setup.sh"
  box.vm.provision "web02", type: "shell", path: "provisions/web02_setup.sh"

end

  
end
