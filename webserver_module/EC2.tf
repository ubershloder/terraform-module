data "aws_ami" "latest-ubuntu-image" {
  most_recent = true
  owners      = ["099720109477"]
  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }
}

resource "aws_instance" "web_server" {
  depends_on                  = [aws_internet_gateway.igw]
  ami                         = data.aws_ami.latest-ubuntu-image.id
  instance_type               = var.aws_instance_type
  associate_public_ip_address = var.public_ip
  disable_api_termination     = var.api_termination
  hibernation                 = var.hibernation
  monitoring                  = var.monitoring_option
  subnet_id                   = aws_subnet.first_sub.id
  vpc_security_group_ids      = [aws_security_group.instance.id]
  tags = {
    Name = "EC2"
  }
}
