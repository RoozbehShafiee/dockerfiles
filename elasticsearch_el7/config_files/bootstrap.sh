#!/bin/sh
su - elasticsearch -c "bin/elasticsearch --network.bind_host 0.0.0.0"
