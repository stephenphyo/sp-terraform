output "rhel_ami_id" {
  description = "AMI ID of the latest matching RHEL image"
  value       = data.aws_ami.rhel.id
}

output "rhel_ami_name" {
  description = "Name of the RHEL AMI"
  value       = data.aws_ami.rhel.name
}
