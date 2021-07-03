build {
  sources = [
    "source.amazon-ebs.src"
  ]

  provisioner "shell" {
    inline = [
      "sudo yum -y update",
      "sudo yum -y install httpd"
    ]
  }

  post-processor "amazon-ami-management" {
    regions = [
      "${var.region}"
    ]
    identifier = "${var.name}-${var.env}"
    keep_releases = 3
  }
}
