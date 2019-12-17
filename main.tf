provider "aws" {
  region = var.region
}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/sdh"
  volume_id   = aws_ebs_volume.example.id
  instance_id = aws_instance.web.id
}

resource "aws_instance" "web" {
  ami               = "ami-0ab1d87ce9286b9a4"
  availability_zone = "us-east-1a"
  instance_type     = "t1.micro"

  tags = {
    Name = "orlando-test"
  }
}

resource "aws_ebs_volume" "example" {
  availability_zone = "us-east-1a"
  size              = 1

  tags = {
    Name = "orlando-test"
  }
}
