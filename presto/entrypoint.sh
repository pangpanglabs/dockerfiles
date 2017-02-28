export PRESTO_VERSION=0.167

mkdir -p $ENV_DATA_DIR

PRESTO_HOME=/opt/pangpang/presto-server-${PRESTO_VERSION}

UUID=`uuid`
sed -i "s/ENV_NODE_ID/${UUID}/g" $PRESTO_HOME/etc/node.properties
sed -i "s/ENV_DATA_DIR/${ENV_DATA_DIR}/g" $PRESTO_HOME/etc/node.properties

if [ $ENV_MODE = "Coordinator" ]; then
  mv $PRESTO_HOME/etc/config.properties.coordinator $PRESTO/HOME/config.properties
else
  mv $PRESTO_HOME/etc/config.properties.worker $PRESTO/HOME/config.properties
fi

sed -i "s/ENV_QUERY_MAX/${QUERY_MAX}/g" $PRESTO_HOME/etc/config.properties
sed -i "s/ENV_QUERY_MAX_NODE/${QUERY_MAX_NODE}/g" $PRESTO_HOME/etc/config.properties
sed -i "s/ENV_COORDINATOR_SERVER/${COORDINATOR_SERVER}/g" $PRESTO_HOME/etc/config.properties

sed -i "s/ENV_MAX_HEAP/${MAX_HEAP}/g" $PRESTO_HOME/etc/jvm.properties

sed -i "s/MEMBERSHIP_DB_HOST/${MEMBERSHIP_DB_HOST}/g" $PRESTO_HOME/etc/catalog/membership.properties
sed -i "s/MEMBERSHIP_DB_USER/${MEMBERSHIP_DB_USER}/g" $PRESTO_HOME/etc/catalog/membership.properties
sed -i "s/MEMBERSHIP_DB_PASSWORD/${MEMBERSHIP_DB_PASSWORD}/g" $PRESTO_HOME/etc/catalog/membership.properties

/opt/pangpang/presto-server-${PRESTO_VERSION}/bin/launcher run
