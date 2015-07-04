Vagrant.configure(2) do |config|
  config.vm.box = "centos66-minimal-en"
  config.vm.box_url = "https://github.com/tasukujp/vagrant-boxes-packer/releases/download/v1.0.1/CentOS-6.6-x86_64-minimal-en.box"

  config.hostmanager.enabled = false
  config.hostmanager.manage_host = true
  config.hostmanager.ignore_private_ip = false
  config.hostmanager.include_offline = true

  config.vm.define :master do |master|
    master.vm.provider :virtualbox do |vb|
      vb.name = "hadoop.pseudo.distributed"
      vb.customize ["modifyvm", :id, "--memory", "4096", "--cpus", "2", "--ioapic", "on"]
    end
    master.vm.network :private_network, ip: "192.168.33.10"
    master.vm.hostname = "hadoop.pseudo.distributed"
    master.vm.provision :shell, path: "hosts.sh"
    master.vm.provision :hostmanager
    master.vm.provision :shell, path: "setup.sh"
  end
end
