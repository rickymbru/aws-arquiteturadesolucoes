provider "aws" {
  region = "us-east-1" # Substitua pela região desejada
}

resource "aws_db_instance" "rds_example" {
  allocated_storage       = 20                  # Tamanho do armazenamento em GB
  storage_type            = "gp2"              # Tipo de armazenamento
  engine                  = "mysql"            # Substitua pelo tipo de banco desejado (e.g., postgres, oracle, sqlserver)
  engine_version          = "8.0"              # Versão do banco
  instance_class          = "db.t3.micro"      # Classe da instância
  db_name                 = "exampledb"        # Nome do banco de dados
  username                = "admin"            # Usuário mestre
  password                = "password123"       # Senha mestre (use o AWS Secrets Manager para maior segurança)
  parameter_group_name    = "default.mysql8.0" # Substitua pelo grupo de parâmetros conforme o engine

  backup_retention_period = 7                   # Retenção de backup em dias
  multi_az                = true                # Habilitar MultiAZ para alta disponibilidade

  publicly_accessible     = false               # Indica se o RDS será público ou não
  skip_final_snapshot     = false               # Garante que o snapshot final seja criado ao excluir o RDS

  tags = {
    Name = "MyRDSInstance"
  }
}
