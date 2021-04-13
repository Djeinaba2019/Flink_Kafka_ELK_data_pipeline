#!/bin/sh

curl -X "POST" "http://localhost:18083/connectors/" \
     -H "Content-Type: application/json" \
     -d '{
  "name": "es_sink_DRUGS",
  "config": {
    "topics": "djeinaba.public.drugs4projet",
    "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
    "type.name": "_doc",
    "topic.index.map": "DJEINABA.PUBLIC.DRUGS4PROJET:djeinaba.public.drugs4projet",
    "connection.url": "http://elasticsearch:9200"
  }
}'

curl -X "POST" "http://localhost:18083/connectors/" \
     -H "Content-Type: application/json" \
     -d '{
  "name": "es_sink_PHARMA",
  "config": {
    "topics": "djeinaba.public.pharma4projet",
    "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
    "type.name": "_doc",
    "topic.index.map": "DJEINABA.PUBLIC.PHARMA4PROJET:djeinaba.public.pharma4projet",
    "connection.url": "http://elasticsearch:9200"
  }
}'

curl -X "POST" "http://localhost:18083/connectors/" \
     -H "Content-Type: application/json" \
     -d '{
  "name": "Buyers",
  "config": {
    "topics": "djeinaba.public.pharma4projet",
    "connector.class": "io.confluent.connect.elasticsearch.ElasticsearchSinkConnector",
    "type.name": "_doc",
    "topic.index.map": "DJEINABA.PUBLIC.PHARMA4PROJET:djeinaba.public.pharma4projet",
    "connection.url": "http://elasticsearch:9200"
  }
}'
