# Kubernetes Hosting styles:

## Locally Run Kubernetes (e.g., Minikube):

- **Benefits**: quick local setup, no cloud costs.
- **Trade-offs**: limited to host machine resources
- **Costs**: free, (just local machine and electricity)
- **Limitations**: hardware and performance limitations of the local machine, no scaling
- **Risks/Security**: low, not exposed to the internet
- **Maintenance**: manual updates and management
- **Creation and Scaling**: create cusing minikube cli not designed for scaling
- **CI/CD Integration**: GH/Actions -> self-hosted runner (not for actual deployment) 
- **Conclusion**: best for development and testing, not production.


## Cloud-Managed Kubernetes (e.g., Google GKE, Amazon EKS, Azure AKS):

- **Benefits**: High scalability, reliability, and availability. Managed upgrades and maintenance.
- **Trade-offs**: costs can be higher, transparency
- **Costs**: Variable based on usage, some providers offer free tiers with limitations.
- **Limitations**: dependence on the provider, potential vendor lock-in
- **Risks/Security**: managed by the provider
- **Maintenance**: handled by the provider
- **Creation and Scaling**: creation through provider's cli, easy and automatic
- **CI/CD**: usually plugins or direct actions for GH Actions -> should be easy // store k8 credentials as secrets -> gh action to create cluster
- **Conclusion**: for scalable production environments, provides high availability.

## Self-Managed Kubernetes (e.g., Rancher, Red Hat OpenShift):

- **Benefits**: full control over the setup, customization
- **Trade-offs**: high maintenance, requires more knowledge
- **Costs**: depends on the infrastructure used (potentially high licensing costs)
- **Limitations**: limited by available resources
- **Risks/Security**: all aspects of security must be managed in-house
- **Maintenance**: requires a lot of attention for management and updates.
- **Creation and Scaling**: manual setup and scaling -> creation: install k8 on servers or use Rancher/Openshift for easier setup on servers -> run
- **CI/CD Integration**: send workers to server? 
- **Conclusion**: No dependence, can be expensive -> hardware and work force for setup

## References:
- https://www.capgemini.com/insights/expert-perspectives/choosing-the-right-kubernetes-hosting-solution/
- https://cloudnativenow.com/features/choosing-a-managed-kubernetes-provider/
- https://www.airplane.dev/blog/managed-kubernetes-services
- https://chat.openai.com/ -> https://chat.openai.com/share/1692043a-22ec-4d15-9f99-a4b001ec3ff8 (the template structure is taken from here, also source inspiration)