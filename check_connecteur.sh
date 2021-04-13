# test pour voir si les connecteurs marches ( ici pour voir si le connecteur postgres marche )
  
curl -s "http://localhost:8083/connectors" | jq '.[]'| xargs -I{connector_name} curl -s "http://localhost:8083/connectors/"{connector_name}"/status" | jq -c -M '[.name,.connector.state,.tasks[].state]|join(":|:")'| column -s : -t| sed 's/\"//g'| sort  
    
    
#pour voir si le sink avec elastic marche
curl -s "http://localhost:18083/connectors" | jq '.[]'| xargs -I{connector_name} curl -s "http://localhost:18083/connectors/"{connector_name}"/status" | jq -c -M '[.name,.connector.state,.tasks[].state]|join(":|:")'| column -s : -t| sed 's/\"//g'| sort


#consume kafka topic djeinaba.public.drugs4projet
docker-compose exec kafka-connect-cp \
                   kafka-avro-console-consumer \
                    --bootstrap-server kafka:29092 \
                    --property schema.registry.url=http://schema-registry:8081 \
                    --topic djeinaba.public.drugs4projet
                  
                  
docker-compose exec kafka-connect-cp \
                   kafka-avro-console-consumer \
                    --bootstrap-server kafka:29092 \
                    --property schema.registry.url=http://schema-registry:8081 \
                    --topic asgard.public.pharm4projet
         

#to delete a connector

curl -X DELETE http://localhost:8083/connectors/<connector-name>

