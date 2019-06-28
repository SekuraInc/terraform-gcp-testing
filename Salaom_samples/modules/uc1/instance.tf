
// Create a new instance


resource "google_compute_instance" "default" {
  #count = 3
  name         = "${format("%s","${var.company}-${var.env}-${var.region_map["${var.var_region_name}"]}-instance1")}"
  machine_type = "n1-standard-1"
  zone         =   "${format("%s","${var.var_region_name}-a")}"
  tags         = ["ssh","http"]
  
  boot_disk {
    initialize_params {
    image  = "debian-9-stretch-v20180227"
      
    }
  }

  labels {
      webserver =  "true"     
    }

  metadata {
        #sshKeys = "ubuntu:${file(var.public_key_path)}"
        startup-script = <<SCRIPT
        apt-get -y update
        apt-get -y install nginx
        export HOSTNAME=$(hostname | tr -d '\n')
        export PRIVATE_IP=$(curl -sf -H 'Metadata-Flavor:Google' http://metadata/computeMetadata/v1/instance/network-interfaces/0/ip | tr -d '\n')
        echo "Welcome to $HOSTNAME - $PRIVATE_IP" > /usr/share/nginx/www/index.html
        service nginx start
        SCRIPT
    } 


 network_interface {
    subnetwork = "${google_compute_subnetwork.public_subnet.name}"
    access_config {
      // Ephemeral IP
    }
  }
}


