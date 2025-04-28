#!/bin/bash

# Get first argument as short name
SHORT_NAME=$1
# Get second argument as number of nodes, default to 10 if not provided
NUM_NODES=${2:-10}

# Check if SHORT_NAME was provided
if [ -z "$SHORT_NAME" ]; then
  echo "Usage: $0 <short_name> [number_of_nodes]"
fi


# Build the list of nodes
NODES=""
for i in $(seq 1 "$NUM_NODES"); do
  NODES+="ccycloud-${i}.${SHORT_NAME}.root.comops.site "
done
export NODES="${NODES% }"  # Trim trailing space
echo "Exported NODES=\"$NODES\""

# Cluster name
export CLUSTER_NAME=$SHORT_NAME

# Licensing
export PAYWALL_USER=<paywall_user>
export PAYWALL_PASSWORD=<paywall_password>
export LICENSE_FILE=<license_file>

# Nodes connection
export NODE_USER="root"
export NODE_KEY="/Users/jbertelli/ycloud-key" # Passwordless ssh connection

# Auth & Log
export DEFAULT_PASSWORD="Cloudera1234"
export DEFAULT_ADMIN_USER="jeremy"

# Kerberos
export REALM="$(echo "${SHORT_NAME}" | tr '[:lower:]' '[:upper:]').CLOUDERA.COM"

# TLS/SSL
export ROOT_CA_CERT="/Users/jbertelli/jbiCA.crt"
export ROOT_CA_KEY="/Users/jbertelli/jbiCA.key"
