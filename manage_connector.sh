#! /bin/bash

#################################################
# Environemnt Variable for Confluent Cloud
# this is the Confluent Cloud API Key and Secret
ccloud_key="$CONFLUENT_CLOUD_API_KEY"
ccloud_secret="$CONFLUENT_CLOUD_API_SECRET"

# This is the Confluent Cloud environment"
env_id="$CONFLUENT_CLOUD_ENV_ID"

# This is the Confluent Cluster ID
kafka_cluster_ia="$CONFLUENT_CLOUD_KAFKA_CLUSTER_ID"

# This is the service Account id that runs the connector"
serviceAccount="$CONFLUENT_CLOUD_SERVICE_ACCOUNT"
#################################################


operation="pause"
#operation="resume"



# SQL Server information 
#export PodName=pod1
#jexport SQLServerHost="dbserver.us-east-1.elb.amazonaws.com"
#export SQLServerPassword="password"
#export SQLServerUser="sa"
#export SQLDBName="demo"

connectorName="SqlServerCdcSourceConnector_$PodName"

#--header "Authorization: Basic $auth_key" \
curl --request PUT \
  -u "$ccloud_key:$ccloud_secret" \
  --url https://api.confluent.cloud/connect/v1/environments/$env_id/clusters/$kafka_cluster_id/connectors/$connectorName/$operation 

