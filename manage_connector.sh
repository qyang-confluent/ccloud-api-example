#! /bin/bash

# this is the Confluent Cloud API Key and Secret
export ccloud_key="$CONFLUENT_CLOUD_API_KEY"
export ccloud_secret="$CONFLUENT_CLOUD_API_SECRET"


operation="pause"
#operation="resume"

# This is the Confluent Cloud environment" 
export env_id="env-m8pnj2"
# This is the Confluent Cluster ID
export kafka_cluster_id="lkc-prvpdy"

# This is the service Account id that runs the connector"
export serviceAccount="sa-9po6r5"

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

