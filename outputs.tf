output "aws_vpcs" {
    value = data.aws_vpcs.myvpcs
}

output "aws_subnets" {
    value = data.aws_subnets.subnets
}

output "aws_security_groups" {
    value = data.aws_security_groups.sg.ids
}