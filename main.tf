
# Terraform NULL RESOURCE
# Copy license.key to the SSH Server
resource "null_resource" "copy_license" {
  triggers = {
    always-update =  timestamp()
  }

  # Connection Block for connecting to the SSH Server
  connection {
    type = "ssh"
    host = "ssh.application.local"
    port = "1234" 
    user = "root"
    password = "root"
  }  

 # Copies the license.key file to the SSH Server
  provisioner "file" {
    source      = "./license.key"
    destination = "/etc/license.key"
  }

# Change mode license.key
  provisioner "remote-exec" {
    inline = [
      "sudo chmod 0600 /etc/license.key"
    ]
  }
}
