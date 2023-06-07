#! /bin/bash


# this is the Confluent Cloud API Key and Secret
export ccloud_key="$CONFLUENT_CLOUD_API_KEY"
export ccloud_secret="$CONFLUENT_CLOUD_API_SECRET"


# This is the Confluent Cloud environment" 
export env_id="env-m8pnj2"
# This is the Confluent Cluster ID
export kafka_cluster_id="lkc-prvpdy"

# This is the service Account id that runs the connector"
export serviceAccount="sa-9po6r5"

# SQL Server information 
export PodName=pod1
export SQLServerHost="dbserver.us-east-1.elb.amazonaws.com"
export SQLServerPassword="password"
export SQLServerUser="sa"
export SQLDBName="demo"


#auth_key=`echo -n "$ccloud_key:$ccloud_secret" | base64`
#auth_key="$ccloud_key:$ccloud_secret"

#--header "Authorization: Basic $auth_key" \
curl --request POST \
  -u "$ccloud_key:$ccloud_secret" \
  --url https://api.confluent.cloud/connect/v1/environments/$env_id/clusters/$kafka_cluster_id/connectors \
  --header 'content-type: application/json' \
  --data '{  
    "name": "SqlServerCdcSourceConnector_'$PodName'",
    "config": {
        "connector.class": "SqlServerCdcSource",
        "name": "SqlServerCdcSourceConnector_'$PodName'",
        "kafka.auth.mode": "SERVICE_ACCOUNT",
        "kafka.service.account.id": "'$serviceAccount'",
        "database.hostname": "'$SQLServerHost'",
        "database.port": "1433",
        "database.user": "'$SQLServerUser'",
        "database.password": "'$SQLServerPassword'",
        "database.dbname": "'$SQLDBName'",
        "database.server.name": "asc.cdc.public",
        "database.instance": "MSSQLSERVER",
        "database.applicationIntent": "ReadOnly",
        "snapshot.isolation.mode": "repeatable_read",
        "snapshot.mode": "initial",
        "tombstones.on.delete": "true",
        "poll.interval.ms": "1000",
        "max.batch.size": "1000",
        "event.processing.failure.handling.mode": "fail",
        "heartbeat.interval.ms": "0",
        "database.history.skip.unparseable.ddl": "true",
        "provide.transaction.metadata": "false",
        "decimal.handling.mode": "precise",
        "binary.handling.mode": "bytes",
        "time.precision.mode": "adaptive",
        "cleanup.policy": "delete",
        "output.data.format": "AVRO",
        "after.state.only": "true",
        "output.key.format": "AVRO",
        "json.output.decimal.format": "BASE64",
        "tasks.max": "1"
    }
}'

