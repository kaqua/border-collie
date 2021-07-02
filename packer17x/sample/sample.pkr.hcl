
data "amazon-ami" "autogenerated_1" {
  filters = {
    name = "amzn2-ami-hvm-*-x86_64-gp2"
  }
  most_recent = true
  owners      = ["amazon"]
  profile     = "${var.profile}"
  region      = "${var.region}"
}

source "amazon-ebs" "autogenerated_1" {
  ami_name      = "${var.name}_${var.env}"
  instance_type = "${var.instance_type}"
  profile       = "${var.profile}"
  region        = "${var.region}"
  run_tags = {
    Name = "Packer_Building"
  }
  security_group_id = "${var.security_group_id}"
  source_ami        = "${data.amazon-ami.autogenerated_1.id}"
  ssh_timeout       = "5m"
  ssh_username      = "ec2-user"
  subnet_id         = "${var.subnet_id}"
  tags = {
    Environment = "${var.environment}"
    Name        = "${var.name}"
  }
  vpc_id = "${var.vpc_id}"
}

build {
  sources = ["source.amazon-ebs.autogenerated_1"]

  provisioner "shell" {
    inline = ["sudo yum -y update", "sudo yum -y install httpd"]
  }

}
