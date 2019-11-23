# https://github.com/hashicorp/vagrant/issues/1906#issuecomment-21082400
Vagrant.configure("2") do |config|

  config.vm.define "gentoo" do |gentoo|
    gentoo.vm.box = "generic/gentoo"
    gentoo.vm.provider "virtualbox" do |vbox|
      vbox.cpus = `sysctl -n hw.physicalcpu`
      vbox.memory = 4096
    end
    gentoo.vm.synced_folder ".", "/vagrant"
    gentoo.vm.provision "shell", inline: "USE='sqlite' sudo -E emerge -uq app-portage/gentoolkit app-admin/ansible"
    gentoo.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "site.yml"
    end
  end

  config.vm.define "ubuntu18" do |ubuntu18|
    ubuntu18.vm.box = "ubuntu/bionic64"
    ubuntu18.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "site.yml"
    end
  end
end
