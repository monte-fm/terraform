resource "aws_efs_file_system" "efs" {
  creation_token   = "${var.environment}-${var.stack}-${var.efs_name_suffix} EFS"
  performance_mode = "generalPurpose"
  encrypted        = "false"
  tags = {
    Name = "${var.environment}-${var.stack}-${var.efs_name_suffix} EFS"
    ENV  = "${var.environment}-${var.stack}"
  }
}

resource "aws_efs_access_point" "efs_access_point" {
  file_system_id = aws_efs_file_system.efs.id
}

resource "aws_efs_mount_target" "subnet_a" {
  depends_on      = [data.aws_subnet_ids.private_subnet]
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = sort(data.aws_subnet_ids.private_subnet.ids)[0]
  security_groups = [data.aws_security_group.sg.id]
}

resource "aws_efs_mount_target" "subnet_b" {
  depends_on      = [data.aws_subnet_ids.private_subnet]
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = sort(data.aws_subnet_ids.private_subnet.ids)[1]
  security_groups = [data.aws_security_group.sg.id]
}

resource "aws_efs_mount_target" "subnet_c" {
  depends_on      = [data.aws_subnet_ids.private_subnet]
  file_system_id  = aws_efs_file_system.efs.id
  subnet_id       = sort(data.aws_subnet_ids.private_subnet.ids)[2]
  security_groups = [data.aws_security_group.sg.id]
}
