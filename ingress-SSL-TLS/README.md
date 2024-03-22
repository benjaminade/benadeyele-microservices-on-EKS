# Implement HTTPS and Let's Encrypt with Cert-Manager

1. Install ingress controller. A Network loadbalancer will be  created where all the external traffic will be sent. Do:

$ kubectl apply -f 01-install-nginx-controller.yaml

You can see the ingress resources and pods in ingress-nginx namespace and you can check using the command:

$ kubectl get all -n ingress-nginx

2. Install the CustomResourceDefinitions’s for cert-manager in your cluster. They define custom resource types such as Certificate, Issuer, and ClusterIssuer, which users can then use to define their SSL certificates and issuer configurations.

$ kubectl apply -f 02-cert-manager.crds.yaml

3. You can now deploy the sockshop application. Then goto Route53 and create DNS record for your domain name specified as host in your ingress-rule file

4. Now, Install cert-manager to provision SSL Certificates to Kubernetes      Clusters 

$ kubectl apply -f 03-cert-manager.yaml

5. We now configure a Cluster Issuer (LetsEncrypt) to issue SSLs. Add your email address in email parameter.

$ kubectl apply -f 04-cert-issuer.yml

6. The next step is to create an Ingress file and add SSL to your ingress controller. Put this file in same namespace as that of the sock-shop application.

$ kubectl apply -f sock-shop-ingress.yml

With these step you should be able to issue certificate for your application. SSL takes a few minutes to issue. The issued Certificate is stored in the secret tls-secret.

