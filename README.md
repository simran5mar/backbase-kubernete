# backbase-kubernete
Description
1. The terraform scripts deploys the EKS to AWS.
2. This helm chart deploy a backbase-jenkins docker image to a kubernetes cluster, exposing the port 8085 as required.
A Default jenkins JOB called "backbase" is create on boot time for reading the Jenkinsfile on the Java sample REPO (https://github.com/simran5mar/backbase-sample.git)
An specific Public Docker image was created for this task and it's hosted on dockerhub (https://hub.docker.com/r/simran5mar/backbase-jenkins)

Requirements
For this solution to run its required to have:

1. Kubernetes cluster running. (covered in step 1 and Step 2)
2. helm installed (covered in step 3).
3. kubectl configured to access kubernetes cluster.

Steps to create the scenario
1. Clone this REPO

        $ git clone https://github.com/simran5mar/backbase-kubernete.git

2. Use below commands to create a EKS on AWS, install awscli and configure the credentials before running commands.

        $ cd backbase-kubernete
        $ brew install awscli

   Place your progmatic keys for your aws account.
   
        $ aws configure
        
        $ terraform init
        $ terraform plan
        $ terraform apply
        $ aws eks --region us-east-1 update-kubeconfig --name my-eks-cluster

3. Install Helm chart

        $ curl https://raw.githubusercontent.com/kubernetes/helm/master/scripts/get > get_helm.sh
        $ chmod 700 get_helm.sh 
        $ ./get_helm.sh
        $ kubectl apply -f rbac_helm.yaml 
        $ helm init --service-account tiller

   To verify helm installation 

        $ kubectl --namespace kube-system get pods
        $ helm search mongodb

4. Use Helm to deploy backbase-jenkins docker image

        $ helm install --name=backbase-jenkins helm/backbase-jenkins/
5. Check helm releases

        $ helm list
6. Get Loadbalancer public IP address for jenkins

        $ kubectl get service backbase-jenkins
7. Access Jenkins on browser using the public IP address on port 8085 Example: http://<dns_name>:8085

8. On Jenkins WEB check the status of a Job called 'backbase'. Pipeline must have run successfully.
