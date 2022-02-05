Vagrant.configure("2") do |config|
  if Vagrant.has_plugin?("vagrant-vbguest") then
    config.vbguest.auto_update = false
  end

  config.vm.box = "generic/debian10"

  config.vm.synced_folder ".", "/vagrant",
                          owner: "vagrant",
                          group: "vagrant",
                          type: "virtualbox"

  config.vm.synced_folder "./server", "/home/vagrant/app/server",
                          create: true,
                          owner: "vagrant",
                          group: "vagrant"

  config.vm.synced_folder "./client", "/home/vagrant/app/client",
                          create: true,
                          owner: "vagrant",
                          group: "vagrant",
                          type: "rsync"

  config.vm.define "rust-nodejs-debian" do |server|
    server.vm.hostname = "rust-nodejs-debian"

    server.vm.provider "virtualbox" do |vb|
      vb.name = config.vm.box.gsub(/\//, "_") + "_" + server.vm.hostname
      vb.cpus = 2
      vb.memory = 1024
    end

    server.vm.network "forwarded_port", guest: 3000, host: 3030

    server.vm.provision "shell", path: "./shell/cargo-init.sh", privileged: false

    server.vm.provision "ansible_local" do |ansible|
      ansible.playbook = "/vagrant/ansible/playbook.yml"
    end

    server.vm.provision "docker" do |d|
      d.run "postgresql",
        image: "postgres",
        args: '-e POSTGRES_USER=postgres -e POSTGRES_PASSWORD=postgres -p 5432:5432 -d'
      d.run "redis",
        image: "redis",
        args: '-d -p 6379:6379'
    end
  end
end