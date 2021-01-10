# backbase_kubernete
Description
1. The terraform scripts deploys the EKS to AWS.
2. This helm chart deploy a backbase-jenkins docker image to a kubernetes cluster, exposing the port 8080 as required.
A Default jenkins JOB called "backbase" is create on boot time for reading the Jenkinsfile on the Java sample REPO (https://github.com/simran5mar/backbase-java-sample.git)
An specific Public Docker image was created for this task and it's hosted on dockerhub (https://hub.docker.com/r/simran5mar/backbase-jenkins)

Requirements
For this solution to run its required to have:

1. Kubernetes cluster running.
2. helm installed.
3. kubectl configured to access kubernetes cluster;

Steps to create the scenario
1. Clone this REPO

$ git clone https://github.com/simran5mar/backbase-kubernetes.git

2. Use below commands to create a EKS on AWS

$ terraform init
$ terraform plan
$ terraform apply
$ aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster

3. Use Helm to deploy backbase-jenkins docker image

$ helm install --name=backbase-jenkins helm/backbase-jenkins/
4. Check helm releases

$ helm list
5. Get Loadbalancer public IP address for jenkins

$ kubectl get service backbase-jenkins
6. Access Jenkins on browser using the public IP address on port 8085 Example: http://35.202.238.35:8085

7. On Jenkins WEB check the status of a Job called 'backbase'. Pipeline must have run successfully.
