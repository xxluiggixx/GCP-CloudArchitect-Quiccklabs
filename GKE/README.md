# Google Kubernetes Engine (GKE)
 Terraform recognizes files ending in .tf or .tf.json as configuration files and will load them when it runs.
## Namespaces
A multi-tenancy cluster allows for multiple users or teams to share one cluster for their workloads while maintaining isolation and fair resource sharing. This is achieved by creating namespaces. Namespaces allow multiple virtual clusters to exist on the same physical cluster

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

## Best practices for clusters
Costs vary between regions based on a variety of factors. For example, resources in the us-west2 region tend to be more expensive than those in us-central1.

When selecting a region or zone for your cluster, examine what your app is doing. For a latency-sensitive production environment, placing your app in a region/zone with decreased network latency and increased efficiency would likely give you the best performance-to-cost ratio.

However, a non-latency-sensitive dev environment could be placed in a less expensive region to reduce costs.

## Vertical Pod Autoscaler
- [VPA](https://www.kubecost.com/kubernetes-autoscaling/kubernetes-vpa/)
The above generates a manifest for a Vertical Pod Autoscaler targeting the hello-server deployment with an Update Policy of Off. A VPA can have one of three different update policies which can be useful depending on your application:

- Off: this policy means VPA will generate recommendations based on historical data which you can manually apply.
- Initial: VPA recommendations will be used to create new pods once and then won't change the pod size after.
- Auto: pods will regularly be deleted and recreated to match the size of the recommendations.
Example
´´´
cat << EOF > hello-vpa.yaml
apiVersion: autoscaling.k8s.io/v1
kind: VerticalPodAutoscaler
metadata:
  name: hello-server-vpa
spec:
  targetRef:
    apiVersion: "apps/v1"
    kind:       Deployment
    name:       hello-server
  updatePolicy:
    updateMode: "Off"
EOF
´´´

When it appears, you'll see several different recommendation types, each with values for CPU and memory:

Lower Bound: this is the lower bound number VPA looks at for triggering a resize. If your pod utilization goes below this, VPA will delete the pod and scale it down.
Target: this is the value VPA will use when resizing the pod.
Uncapped Target: if no minimum or maximum capacity is assigned to the VPA, this will be the target utilization for VPA.
Upper Bound: this is the upper bound number VPA looks at for triggering a resize. If your pod utilization goes above this, VPA will delete the pod and scale it up.