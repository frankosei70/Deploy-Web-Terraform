
# create the subnet group for the rds instance
resource "aws_db_subnet_group" "database_subnet_group" {
  name         = "database_subnet"
  subnet_ids   = [aws_subnet.private_data_subnet_az1.id, aws_subnet.private_data_subnet_az2.id]
  description  = "subnet that will host the databse"

  tags   = {
    Name = "database_subnet"
  }
}


# create the rds instance
resource "aws_db_instance" "database_instance" {
  engine                  = "mysql"
  engine_version          = "8.0.40"
  multi_az                = false
  identifier              = "dev-database"
  username                = "frankosei70"
  password                = "Diamond123"
  instance_class          = "db.t3.micro"
  allocated_storage       = 200
  db_subnet_group_name    = aws_db_subnet_group.database_subnet_group.name
  vpc_security_group_ids  = [aws_security_group.database_security_group.id]
  availability_zone       = "us-east-2a"
  db_name                 = "website_db"
  skip_final_snapshot     = true
}