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


## Module best practices
In many ways, Terraform modules are similar to the concepts of libraries, packages, or modules found in most programming languages, and they provide many of the same benefits. Just like almost any non-trivial computer program, real-world Terraform configurations should almost always use modules to provide the benefits mentioned above.

It is recommended that every Terraform practitioner use modules by following these best practices:

 - Start writing your configuration with a plan for modules. Even for slightly complex Terraform configurations managed by a single person, the benefits of using modules outweigh the time it takes to use them properly.

 - Use local modules to organize and encapsulate your code. Even if you aren't using or publishing remote modules, organizing your configuration in terms of modules from the beginning will significantly reduce the burden of maintaining and updating your configuration as your infrastructure grows in complexity.

 - Use the public [Terraform Registry](https://registry.terraform.io/) to find useful modules. This way you can quickly and confidently implement your configuration by relying on the work of others.

 - Publish and share modules with your team. Most infrastructure is managed by a team of people, and modules are an important tool that teams can use to create and maintain infrastructure. As mentioned earlier, you can publish modules either publicly or privately. You will see how to do this in a later lab in this series.