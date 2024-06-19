# Terraform
 Terraform recognizes files ending in .tf or .tf.json as configuration files and will load them when it runs.
## Terraform block
The terraform {} block is required so Terraform knows which provider to download from the Terraform Registry. In the configuration above, the google provider's source is defined as hashicorp/google which is shorthand for registry.terraform.io/hashicorp/google.

You can also assign a version to each provider defined in the required_providers block. The version argument is optional, but recommended. It is used to constrain the provider to a specific version or a range of versions in order to prevent downloading a new provider that may possibly contain breaking changes. If the version isn't specified, Terraform will automatically download the most recent provider during initialization.

To learn more, on the HashiCorp Terraform website, see Provider Requirements.

## Providers
The provider block is used to configure the named provider, in this case google. A provider is responsible for creating and managing resources. Multiple provider blocks can exist if a Terraform configuration manages resources from different providers.

## Initialization
The first command to run for a new configuration -- or after checking out an existing configuration from version control -- is terraform init, which initializes various local settings and data that will be used by subsequent commands.
