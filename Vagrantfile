IMAGE_NAME = "bento/ubuntu-16.04"
N = 1

Vagrant.configure("2") do |config|
    config.ssh.insert_key = false

    if (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
		config.vm.synced_folder ".", "/vagrant", mount_options: ["dmode=700,fmode=600"]
	else
		config.vm.synced_folder ".", "/vagrant"
	end

    config.vm.provider "virtualbox" do |v|
        v.memory = 2048
        v.cpus = 2
    end
    
    config.vm.define "k8s-master" do |master|
        master.vm.box = IMAGE_NAME
        master.vm.network "private_network", ip: "192.168.50.10"
        master.vm.hostname = "k8s-master"
        master.vm.provision :shell, path: "scripts/install-ansible.sh"
        master.vm.provision :shell, path: "scripts/ansible-master.sh"
    end
    config.vm.define "ubuntu-desktop" do |desktop|
        desktop.vm.box = "peru/ubuntu-18.04-desktop-amd64"
        desktop.vm.network "private_network", ip: "192.168.50.40"
    end
 
    (1..N).each do |i|
        config.vm.define "node-#{i}" do |node|
            node.vm.box = IMAGE_NAME
            node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
            node.vm.hostname = "node-#{i}"
            node.vm.provision :shell, path: "scripts/install-ansible.sh"
            node.vm.provision :shell, path: "scripts/ansible-node.sh"
        end
    end
end