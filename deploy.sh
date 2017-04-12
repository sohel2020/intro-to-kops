#!/usr/bin/env bash

##
# Note: before you run this or try
# to kops create -f, configure secrets file and source it:
# . secrets.sh
##

export CLUSTER_NAME=intro.dev.hillghost.com
export ZONES="useast-2a,us-east-2b,us-east-2c"
export VPC_ID="vpc-6d8c0c04"

# the public key to be installed for the admin user
# this should be set to be unique per cluster
export SSH_KEY_PATH="private/blog-demo-working.pub"

export NODE_COUNT=3
export ZONES="us-east-2a,us-east-2b,us-east-2c"
export MASTER_ZONES="us-east-2a"
export MASTER_SIZE="t2.medium"
export NODE_SIZE="t2.medium"

kops create cluster \
  --cloud aws \
  --topology private \
  --networking weave \
  --state $KOPS_STATE_STORE \
  --node-count $NODE_COUNT \
  --zones $ZONES \
  --master-zones $MASTER_ZONES \
  --node-size $NODE_SIZE \
  --master-size $MASTER_SIZE \
  --ssh-public-key $SSH_KEY_PATH \
  --vpc $VPC_ID \
  --name $CLUSTER_NAME \
  --kubernetes-version=1.5.6
