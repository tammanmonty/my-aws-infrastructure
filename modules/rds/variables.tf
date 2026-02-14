variable "project_name" {
    description = "The name of the project. Used for naming resources."
    type        = string
}

variable "environment" {
    description = "The deployment environment (e.g., dev, staging, prod)."
    type        = string
}

variable "vpc_id" {
    description = "The ID of the VPC where the RDS instance will be deployed."
    type        = string
}

variable "subnet_ids" {
    description = "A list of subnet IDs for the RDS instance."
    type        = list(string)
}

variable "allowed_security_group_ids" {
    description = "A list of security group IDs that allow access to the RDS instance."
    type        = list(string)
    default     = []
}

variable "allowed_cidr_blocks" {
    description = "A list of CIDR blocks that allow access to the RDS instance."
    type        = list(string)
    default     = []
}

variable "engine" {
    description = "The database engine to use (e.g., mysql, postgres)."
    type        = string
}

variable "engine_version" {
    description = "The version of the database engine."
    type        = string
}

variable "instance_class" {
    description = "The instance class for the RDS instance (e.g., db.t3.micro)."
    type        = string
}

variable "storage_type" {
    description = "The storage type for the RDS instance (e.g., gp2, io1)."
    type        = number
    default     = 20
}

variable "max_allocated_storage" {
    description = "The maximum allocated storage for the RDS instance."
    type        = number
    default     = 100
}

variable "database_name" {
    description = "The name of the initial database to create."
    type        = string
}

variable "master_username" {
    description = "The master username for the RDS instance."
    type        = string
}

variable "master_password" {
    description = "The master password for the RDS instance."
    type        = string
    sensitive   = true
}

variable "publicaly_accessible" {
    description = "Whether the RDS instance should be publicly accessible."
    type        = bool
    default     = false
}

variable "backup_retention_period" {
    description = "The number of days to retain backups for the RDS instance."
    type        = number
    default     = 7
}

variable "skip_final_snapshot" {
    description = "Whether to skip the final snapshot when deleting the RDS instance."
    type        = bool
    default     = true
}