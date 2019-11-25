# https://github.com/hashicorp/vagrant/issues/1906#issuecomment-21082400
Vagrant.configure("2") do |config|

  config.vm.define "gentoo" do |gentoo|
    gentoo.vm.box = "generic/gentoo"
    gentoo.vm.provider "virtualbox" do |vbox|
      vbox.cpus = `sysctl -n hw.physicalcpu`
      vbox.memory = 4096
    end
    gentoo.vm.synced_folder ".", "/vagrant"
    gentoo.vm.provision "shell", inline: "sudo emaint sync --auto"
    gentoo.vm.provision "shell", inline: "sudo emerge --oneshot -uq app-portage/gentoolkit"
    gentoo.vm.provision "shell", inline: "USE='sqlite' sudo -E emerge --oneshot -uNq dev-lang/python"
    gentoo.vm.provision "shell", inline: "PYTHON_TARGETS='python3_6' sudo -E emerge --oneshot -uq app-admin/ansible"
    gentoo.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "site.yml"
    end
  end

  config.vm.define "debian9" do |debian9|
    debian9.vm.box = "generic/debian9"
    debian9.vm.synced_folder ".", "/vagrant"
    debian9.vm.provision "shell", inline: "which pip3 >/dev/null || curl -sL https://bootstrap.pypa.io/get-pip.py -o /tmp/get-pip.py"
    debian9.vm.provision "shell", inline: "which pip3 >/dev/null || sudo python3 /tmp/get-pip.py"
    debian9.vm.provision "shell", inline: "which ansible >/dev/null || sudo pip3 install --quiet ansible"
    debian9.vm.provision "ansible_local" do |ansible|
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
