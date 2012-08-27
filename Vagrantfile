#!/usr/env/ruby
# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.vm.box = "precise64"
  config.vm.box_url = "http://files.vagrantup.com/precise64.box"
  config.vm.forward_port 80, 8080

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding 
  # some recipes and/or roles.
  
  config.vm.provision :chef_solo do |chef|
       chef.cookbooks_path = "/vagrant/vagrant/cookbooks"
    chef.provisioning_path = "~/tmp/vagrant-chef"
   
    chef.add_recipe "default"
  end
end
