resource "google_compute_instance" "vm" {
  name         = "lab-vm"
  machine_type = "e2-medium"
  zone         = "us-central1-a"

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-11"
      size  = 20
    }
  }

  network_interface {
    subnetwork = google_compute_subnetwork.private.id

    # External IP for SSH (lab simplicity)
    access_config {}
  }

  metadata_startup_script = <<-EOT
    #!/bin/bash
    apt-get update -y
    apt-get install -y git
    apt-get install -y git nginx

    systemctl enable nginx
    systemctl start nginx

    echo "🔥 SEIR LAB VM is running" > /var/www/html/index.html

    cd /tmp
    git clone https://github.com/BalericaAI/SEIR-1.git

    chmod +x /tmp/SEIR-1/weekly_lessons/weeka/userscripts/supera.sh
    bash /tmp/SEIR-1/weekly_lessons/weeka/userscripts/supera.sh
  EOT

  tags = ["ssh", "http"]

  depends_on = [
    google_compute_subnetwork.private,
    google_compute_router_nat.nat
  ]
}
