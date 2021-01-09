# backbase_kubernete
Description
1. The terraform scripts deploys the EKS to AWS.
2. This helm chart deploy a backbase-jenkins docker image to a kubernetes cluster, exposing the port 8080 as required.
A Default jenkins JOB called "backbase" is create on boot time for reading the Jenkinsfile on the Java sample REPO (https://github.com/simran5mar/backbase-java-sample.git)
An specific Public Docker image was created for this task and it's hosted on dockerhub (https://hub.docker.com/r/simran5mar/backbase-jenkins)

Requirements
For this solution to run its required to have:

Kubernetes cluster running;
helm installed;
kubectl configured to access kubernetes cluster;
