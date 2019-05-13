IMAGE_NAME = "bento/ubuntu-16.04"
N = 2

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

    # config.vm.define "ansible" do |cfg|
	# 	cfg.vm.box = "ubuntu/bionic64"
	# 	cfg.vm.hostname = "ansible"
	# 	cfg.vm.network "private_network", ip: "192.168.50.5"
	# 	cfg.vm.provision :shell, path: "scripts/install-ansible.sh"
	# 	cfg.vm.provider "virtualbox" do |v|
	# 	  v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]            
	# 	  v.memory = 4096
	# 	end
	# end
    # (1..N).each do |i|
    #     config.vm.define "node-#{i}" do |node|
    #         node.vm.box = IMAGE_NAME
    #         node.vm.network "private_network", ip: "192.168.50.#{i + 10}"
    #         node.vm.hostname = "node-#{i}"
    #     end
    # end
end