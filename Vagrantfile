# -*- mode: ruby -*-
# vi: set ft=ruby :

VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|

  config.vm.box = "opscode-ubuntu-12.04"
  config.vm.box_url = "https://opscode-vm.s3.amazonaws.com/vagrant/opscode_ubuntu-12.04_provisionerless.box"
  config.berkshelf.enabled = true
  config.omnibus.chef_version = :latest
  config.cache.enable :apt
  config.vm.hostname = "dev.bluepill.local"
  config.vm.network :private_network, ip: "192.168.111.11"
  config.vm.network :forwarded_port, guest: 80, host: 8080

  config.vm.synced_folder "../bluepill", "/root/bluepill"

  config.vm.provision :chef_solo do |chef|
    chef.add_recipe 'apt'
    chef.add_recipe 'bluepill_devel'
  end
end
