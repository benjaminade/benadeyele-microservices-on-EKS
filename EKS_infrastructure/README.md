#  Provision an EKS Cluster.
Author: Benjamin Adeyele
Reference: (https://developer.hashicorp.com/terraform/tutorials/kubernetes/eks)

Here,we have terraform configuration files to provision an EKS cluster on AWS.

# The main.tf file
This file contains:
  1. Providers block: specifies the aws region and the dafault profile. The default profile is my AWS configured credentials with which i can interact with AWS. So, go to AWS management console and create an IAM user. Grant the user "admin" privileges. The secret key id and the secret access key of this user will be used to configure access to aws. Just type in the code 
  ---$ aws configure---press enter. Then fill in the required credentials.

  2. The data block: This retrieves the availability zones of the specified region

  3. locals block: used to the strings combined together to form the cluster name.

  4. Randon string resource: it generates a random string needed by the locals block

  5. Module vpc: creates the vpc, private and public subnets, nat gateway for the cluster

  6. The eks module: creates the eks inside the vpc initially created. This module creates the nodes groups
  with the configurations