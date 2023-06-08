# Shell Script example how to manage Confluent Cloud using REST API
## Reference: 
 - [Confluent Cloud REST API Document](https://docs.confluent.io/cloud/current/api.html)

## Required Information
  - [Confluent Cloud API Key/Secret](https://docs.confluent.io/cloud/current/access-management/authenticate/api-keys/api-keys.html#cloud-cloud-api-keys)

## Connector Management

### Create Connector
- Confluent Cloud API Key/Secret
- Confluent Cloud Environment ID
- Confluent Cloud Kafka Cluster ID
- Confluent Cloud Service Account ID
```
# Environemnt Variable for Confluent Cloud
# this is the Confluent Cloud API Key and Secret
CONFLUENT_CLOUD_API_KEY
CONFLUENT_CLOUD_API_SECRET

# This is the Confluent Cloud environment"
$CONFLUENT_CLOUD_ENV_ID

# This is the Confluent Cluster ID
CONFLUENT_CLOUD_KAFKA_CLUSTER_ID

# This is the service Account id that runs the connector"
CONFLUENT_CLOUD_SERVICE_ACCOUNT
```


### Pause/Resume Connector
- Confluent Cloud API Key/Secret
- Confluent Cloud Environment ID
- Confluent Cloud Kafka Cluster ID
- Confluent Cloud Connector Name

### List Connector


  


