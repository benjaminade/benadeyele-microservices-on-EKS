# Implement HTTPS and Let's Encrypt with Cert-Manager

1. Install ingress controller. A Network loadbalancer will be  created where all the external traffic will be sent. Do:

$ kubectl apply -f 01-install-nginx-controller.yml

You can see the ingress resources and pods in ingress-nginx namespace and you can check using the command:

$ kubectl get all -n ingress-nginx

2. Install the CustomResourceDefinitions’s for cert-manager in your cluster. They define custom resource types such as Certificate, Issuer, and ClusterIssuer, which users can then use to define their SSL certificates and issuer configurations.

$ kubectl apply -f 02-cert-manager.crds.yaml

5. You can now deploy the sockshop application. Then goto Route53 and create DNS record for your domain name specified as host in your ingress-rule file
