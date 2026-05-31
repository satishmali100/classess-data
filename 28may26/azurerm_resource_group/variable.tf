variable "rgs" {
    type = map(object({
    type = string
    location = string
    managed_by = optional(string)
    tags = optional(string)
}))}

