resource "aws_instance" "web_server" {
  ami                    = "ami-0db56f446d44f2f09"
  instance_type          = "t3.micro"
  subnet_id              = "subnet-0b7c5daf46a3eaf12"
  
  # Leaving it minimal for now so the import can link up
}
