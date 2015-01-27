#!/bin/bash
export ETCD=$ETCD
until confd -onetime -node $ETCD -config-file /etc/confd/conf.d/myconfig.toml; do
  sleep 5
done

# Run confd in the background to watch the upstream servers
confd -interval 10 -node $ETCD -config-file /etc/confd/conf.d/myconfig.toml &

# Start nginx
nginx
