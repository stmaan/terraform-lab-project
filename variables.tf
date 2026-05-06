variable "namespace_name" {
  description = "Имя неймспейса для экспериментов"
  type        = string
  default     = "terraform-lab"
}

variable "env_label" {
  description = "Метка окружения"
  type        = string
  default     = "learning"
}
