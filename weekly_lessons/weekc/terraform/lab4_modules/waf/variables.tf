variable "name" {
  type = string
}

variable "backend_service" {
  type = string
}

variable "name" {
  type = string
}

variable "enable_geo_blocking" {
  type    = bool
  default = true
}

variable "blocked_region_codes" {
  type    = list(string)
  default = []
}

variable "enable_rate_limit" {
  type    = bool
  default = true
}

variable "rate_limit_count" {
  type    = number
  default = 100
}

variable "rate_limit_interval_sec" {
  type    = number
  default = 60
}

variable "enable_waf_rules" {
  type    = bool
  default = true
}

variable "enable_bot_management" {
  type    = bool
  default = false
}

variable "recaptcha_redirect_site_key" {
  type    = string
  default = ""
}
