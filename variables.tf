variable "glue_connections" {
  description = <<EOT
Map of glue_connections, attributes below
Required:
    - name
Optional:
    - athena_properties
    - catalog_id
    - connection_properties
    - connection_type
    - description
    - match_criteria
    - region
    - tags
    - tags_all
    - authentication_configuration (block):
        - authentication_type (required)
        - basic_authentication_credentials (optional, block):
            - password (required)
            - username (required)
        - custom_authentication_credentials (optional)
        - kms_key_arn (optional)
        - oauth2_properties (optional, block):
            - authorization_code_properties (optional, block):
                - authorization_code (required)
                - redirect_uri (required)
            - oauth2_client_application (optional, block):
                - aws_managed_client_application_reference (optional)
                - user_managed_client_application_client_id (optional)
            - oauth2_credentials (optional, block):
                - access_token (optional)
                - jwt_token (optional)
                - refresh_token (optional)
                - user_managed_client_application_client_secret (optional)
            - oauth2_grant_type (optional)
            - token_url (optional)
            - token_url_parameters_map (optional)
        - secret_arn (optional)
    - physical_connection_requirements (block):
        - availability_zone (optional)
        - security_group_id_list (optional)
        - subnet_id (optional)
EOT

  type = map(object({
    name                  = string
    athena_properties     = optional(map(string))
    catalog_id            = optional(string)
    connection_properties = optional(map(string))
    connection_type       = optional(string)
    description           = optional(string)
    match_criteria        = optional(list(string))
    region                = optional(string)
    tags                  = optional(map(string))
    tags_all              = optional(map(string))
    authentication_configuration = optional(object({
      authentication_type = string
      basic_authentication_credentials = optional(object({
        password = string
        username = string
      }))
      custom_authentication_credentials = optional(map(string))
      kms_key_arn                       = optional(string)
      oauth2_properties = optional(object({
        authorization_code_properties = optional(object({
          authorization_code = string
          redirect_uri       = string
        }))
        oauth2_client_application = optional(object({
          aws_managed_client_application_reference  = optional(string)
          user_managed_client_application_client_id = optional(string)
        }))
        oauth2_credentials = optional(object({
          access_token                                  = optional(string)
          jwt_token                                     = optional(string)
          refresh_token                                 = optional(string)
          user_managed_client_application_client_secret = optional(string)
        }))
        oauth2_grant_type        = optional(string)
        token_url                = optional(string)
        token_url_parameters_map = optional(map(string))
      }))
      secret_arn = optional(string)
    }))
    physical_connection_requirements = optional(object({
      availability_zone      = optional(string)
      security_group_id_list = optional(set(string))
      subnet_id              = optional(string)
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.glue_connections : (
        v.match_criteria == null || (alltrue([for x in v.match_criteria : length(x) >= 1 && length(x) <= 255]))
      )
    ])
    error_message = "must be between 1 and 255 characters"
  }
  # Note: 6 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

