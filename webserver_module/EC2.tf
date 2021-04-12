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
  #availability_zone = var.avail_zone


}
