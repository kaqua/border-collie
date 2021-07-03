data "amazon-ami" "amzn2" {
  filters = {
    name = "amzn2-ami-hvm-*-x86_64-gp2"
  }
  most_recent = true
  owners      = ["amazon"]
  profile     = "${var.profile}"
  region      = "${var.region}"
}

source "amazon-ebs" "src" {
  ami_name      = "${var.name}-${var.env}"
  instance_type = "${var.instance_type}"
  profile       = "${var.profile}"
  region        = "${var.region}"
  run_tags = {
    Name = "Packer Build"
  }
  security_group_id = "${var.security_group_id}"
  source_ami        = "${data.amazon-ami.amzn2.id}"
  ssh_interface     = "private_ip"
  ssh_timeout       = "5m"
  ssh_username      = "ec2-user"
  subnet_id         = "${var.subnet_id}"
  tags = {
    Environment = "${var.env}"
    Name        = "${var.name}-${var.env}"
    Amazon_AMI_Management_Identifier = "${var.name}-${var.env}"
  }
  vpc_id = "${var.vpc_id}"
}
