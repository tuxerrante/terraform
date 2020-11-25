terraform {
  required_version = "0.13.5"
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
  registry_auth {
    address = "index.docker.io/v1/"
    config_file = pathexpand("~/.docker/config.json")
  }
}

resource "docker_image" "ansible" {
  name = "centos:8"
}

resource "docker_container" "ansible" {
  name = "ansible"
  image = docker_image.ansible.name
  user  = "root"
  restart = "no"

  upload {
    file    = "/usr/bin/ansible_setup.sh"
    content = file("ansible_setup.sh")
    executable = true    
  } 
  entrypoint = ["/usr/bin/ansible_setup.sh"]
  
  ports {
    internal = 80
    external = 8080
  }
  ports {
    internal = 22
    external = 2222
  }
  
  volumes {
    container_path  = "/tmp"
    host_path = "${path.cwd}/ansible_volume"
    #read_only = true
  }
  
}