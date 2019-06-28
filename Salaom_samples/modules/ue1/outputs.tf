output "ue1_pri_address"{ value = "${google_compute_instance.default.network_interface.0.address}"}
output "ue1_pub_address"{ value = "${google_compute_instance.default.network_interface.0.access_config.0.assigned_nat_ip}"}
output "ue1_out_public_subnet_name"{ value = "${google_compute_subnetwork.public_subnet.name}"}