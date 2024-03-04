## 02-service-creation

### Initial Thoughts:
- Seems pretty straight forward

### Process:
- Create a new project and follow basic project creation instructions
- I still have a Problem with accessing the repo with my GitHub account via my IDE, that's why I had to use GitHub Desktop

### Outcome:
- simple web service

### References:
- chatGPT

## 03-containerization

### Initial Thoughts:
- Seems pretty straight forward

### Process:
- process a bit more complicated because of typescript
- I don't know if my way of copying and build is correct, feedback would be nice :D

### Outcome:
- simple docker image with a simple web service
- I have added you as a Collaborator to my repo, so you can check it out
- also here the link command: docker pull justingebert/devops-testapp

### References:
- chatGPT and docs.docker.com

## 06-docker-compose

### Initial Thoughts:
- Seems pretty straight forward, I have worked with docker-compose before

### Process:
- I choose mongoDB as my database because I have worked with it before and the setup is pretty easy, no need for tables or anything

### Outcome:
- 2 containers communicating with each other

### References:
- chatGPT
- docs.docker.com

## 06-kubernetes-hosting

### Initial Thoughts:
- some research, ChatGPT should be able to give a brief overview

### Process:
- ask chatGPT for help, quick summary -> quick start guide
- google for k8s hosting

### Outcome:
/K8s hosting options.md
Output:
```console
Justin@DESKTOP-XXXXXX MINGW64 ~
$ minikube start
😄  minikube v1.32.0 on Microsoft Windows 11 Home 10.0.22621.2715 Build 22621.2715
✨  Automatically selected the docker driver
📌  Using Docker Desktop driver with root privileges
👍  Starting control plane node minikube in cluster minikube
🚜  Pulling base image ...
💾  Downloading Kubernetes v1.28.3 preload ...
    > preloaded-images-k8s-v18-v1...:  403.35 MiB / 403.35 MiB  100.00% 20.55 M
    > gcr.io/k8s-minikube/kicbase...:  453.90 MiB / 453.90 MiB  100.00% 15.32 M
🔥  Creating docker container (CPUs=2, Memory=8100MB) ...
🐳  Preparing Kubernetes v1.28.3 on Docker 24.0.7 ...
    ▪ Generating certificates and keys ...
    ▪ Booting up control plane ...
    ▪ Configuring RBAC rules ...
🔗  Configuring bridge CNI (Container Networking Interface) ...
🔎  Verifying Kubernetes components...
    ▪ Using image gcr.io/k8s-minikube/storage-provisioner:v5
🌟  Enabled addons: storage-provisioner, default-storageclass

❗  C:\Program Files\Docker\Docker\resources\bin\kubectl.exe is version 1.25.2, which may have incompatibilities with Kubernetes 1.28.3.
    ▪ Want kubectl v1.28.3? Try 'minikube kubectl -- get pods -A'
🏄  Done! kubectl is now configured to use "minikube" cluster and "default" namespace by default

Justin@DESKTOP-XXXXXX MINGW64 ~
$ minikube status
minikube
type: Control Plane
host: Running
kubelet: Running
apiserver: Running
kubeconfig: Configured


Justin@DESKTOP-XXXXXX MINGW64 ~
$ kubectl get nodes
NAME       STATUS   ROLES           AGE   VERSION
minikube   Ready    control-plane   68s   v1.28.3
```

### References:
- https://www.capgemini.com/insights/expert-perspectives/choosing-the-right-kubernetes-hosting-solution/
- https://cloudnativenow.com/features/choosing-a-managed-kubernetes-provider/
- https://www.airplane.dev/blog/managed-kubernetes-services
- https://chat.openai.com/

## 08-kubneretes-deployment

### Initial Thoughts:
- use kompose to convert docker compose to k8s yaml files -> generated filed in /app/k8s/ - inspiration for my own manifests, haven't had the time to test generated ones
- webserver is a deployment + service, k8s takes over load balancing
- database is a stateful resource, k8s takes care of scaling and availability, volume is needed for persistent storage (PVC), ReadWriteOnce is needed for MongoDB so only one pod can access the volume at a time -> no data corruption

### Process:

- follow basic tutorials/ blogs
- issues with understanding access to k8s cluster
- mongodb URI in project is wrong, had to change it to mongodb://mongo:27017/testapp 
-> still connection error:Error connecting to MongoDB MongooseServerSelectionError: getaddrinfo EAI_AGAIN mongodb

  
### Outcome:
- yaml files for deployment, still issues with pods accessing mongodb, I will try to fix that on the weekend

https://yasharma06.medium.com/deploy-locally-nodejs-and-mongodb-application-locally-c1bad2308d11
- https://codefresh.io/learn/kubernetes-deployment/kubernetes-deployment-yaml/
- https://www.mirantis.com/blog/introduction-to-yaml-creating-a-kubernetes-deployment/
- https://devopscube.com/deploy-mongodb-kubernetes/

## 09-terraform

### Initial Thoughts:
- i want to set up k8s using terraform

### Process:
- reasearch terraform and k8s
- set up provider -> init -> validate 
- set up k8s cluster -> validate -> plan -> apply
- creation takes a while -> was an issues that Loadbalancer on local machien was ony possible with tunnel so I switched to NodePort
- after cretion destruction is easy with - terraform destroy
- over reasearch i found the command minikube dashboard which is really helpful when leaning k8s imo

### Outcome:
- state file created

### References:
- https://medium.com/rahasak/terraform-kubernetes-integration-with-minikube-334c43151931
