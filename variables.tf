variable "name" {
  type = string
  description = "github team name"
}

variable "desc" {
  type = string
  description = "description"
}

variable "membership_list" {
  type = list(object({username=string, is_maintainer=bool}))
  description = "membership list"
}

variable "repo_accessibility" {
  type = list(object({repository_name=string, permission=string}))
  validation {
    condition     = alltrue([
      for repo_access in var.repo_accessibility :
            contains(["pull", "triage", "push", "maintain", "admin"], repo_access.permission)
    ])
    error_message = "Valid values for var: permission are (pull, triage, push, maintain, admin)."
  }
}
