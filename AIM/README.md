# Cloud IAM
[Documentación](https://cloud.google.com/iam/docs/overview)
IAM lets you grant granular access to specific Google Cloud resources and helps prevent access to other resources. IAM lets you adopt the security principle of least privilege, which states that nobody should have more permissions than they actually need.

## How IAM works
With IAM, you manage access control by defining who (identity) has what access (role) for which resource

This model for access management has three main parts:

* Principal. A principal can be a Google Account (for end users), a service account (for applications and compute workloads), a Google group, or a Google Workspace account or Cloud Identity domain that can access a resource. Each principal has its own identifier, which is typically an email address.
* Role. A role is a collection of permissions. Permissions determine what operations are allowed on a resource. When you grant a role to a principal, you grant all the permissions that the role contains.
* Policy. The allow policy is a collection of role bindings that bind one or more principals to individual roles. When you want to define who (principal) has what type of access (role) on a resource, you create an allow policy and attach it to the resource.
## Roles
* Basic roles: Roles historically available in the Google Cloud console. These roles are Owner, Editor, and Viewer.
** Caution: Basic roles include thousands of permissions across all Google Cloud services. In production environments, do not grant basic roles unless there is no alternative. Instead, grant the most limited predefined roles or custom roles that meet your needs.

* Predefined roles: Roles that give finer-grained access control than the basic roles. For example, the predefined role Pub/Sub Publisher (roles/pubsub.publisher) provides access to only publish messages to a Pub/Sub topic.

* Custom roles: Roles that you create to tailor permissions to the needs of your organization when predefined roles don't meet your needs.
## Use Cases
[Documentación](https://cloud.google.com/pubsub/docs/overview#common_use_cases)