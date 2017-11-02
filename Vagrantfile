# -*- mode: ruby -*-
# vi: set ft=ruby :

# variables
$vm_box = "bento/centos-7.4"
$vm_gui = false
$vm_name = "vagrant-box"
$vm_memory = 2048
$vm_cpu = 2

Vagrant.configure("2") do |config|
  config.vm.box = $vm_box
  config.vm.communicator = "ssh"
  config.vm.hostname = $vm_name
  config.vm.synced_folder ".", "/vagrant"

  # ssh
  config.ssh.username = "vagrant"
  config.ssh.password = "vagrant"
  config.ssh.forward_agent = true

  # port forwarding
  config.vm.network :forwarded_port, guest: 22, host: 2222, id: 'ssh', auto_correct: true
  config.vm.network :forwarded_port, guest: 80, host: 8080, id: 'http', auto_correct: true
  config.vm.network :forwarded_port, guest: 443, host: 8443, id: 'https', auto_correct: true

  # virtualbox
  config.vm.provider :virtualbox do |v, override|
      v.name = $vm_name
      v.gui = $vm_gui
      v.customize ["modifyvm", :id, "--memory", $vm_memory]
      v.customize ["modifyvm", :id, "--cpus", $vm_cpu]
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["setextradata", "global", "GUI/SuppressMessages", "all" ]
  end

  # vmware_fusion
  config.vm.provider :vmware_fusion do |v, override|
      v.name = $vm_name
      v.gui = $vm_gui
      v.vmx["memsize"] = $vm_memory
      v.vmx["numvcpus"] = $vm_cpu
      v.vmx["ethernet0.virtualDev"] = "vmxnet3"
      v.vmx["RemoteDisplay.vnc.enabled"] = "false"
      v.vmx["RemoteDisplay.vnc.port"] = "5900"
      v.vmx["scsi0.virtualDev"] = "lsisas1068"
  end

  config.vm.provision :shell do |s|
    s.inline = '/vagrant/share/bootstrap.sh'
  end
end
