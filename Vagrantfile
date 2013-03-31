# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box  = "ubuntu-12-04"
  config.vm.box_url =  "http://cloud-images.ubuntu.com/precise/current/precise-server-cloudimg-vagrant-i386-disk1.box"
  config.vm.forward_port 3000, 3000
  config.vm.host_name = "sgap"

  config.vm.provision :puppet do |puppet|
    puppet.manifests_path = 'puppet/manifests'
    puppet.module_path    = 'puppet/modules'
  end
end
