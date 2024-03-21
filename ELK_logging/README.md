# The ELK logging folder
ELK stands for Elasticsearcg, logstash and Kibana. 

Note of mentioning here is filebeat that scrapes the logs from the pods and sends it to logstash which converts it to different format before sending it to Elasticsearc the stores the logs. Kibana is there to give us a visual representations of the logs in form of graphs etc

These tools are the logging tools.

To deploy the yaml file in this folder to our cluster, do:
$ kubectl apply -f .
The dot at the end of the command ensure that all the files in the folder are deployed in our cluster
