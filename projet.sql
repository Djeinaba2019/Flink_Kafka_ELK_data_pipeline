#Creation du stream sur le topic drugs4projet

CREATE STREAM DRUGS4PROJET WITH (
 kafka_topic = 'djeinaba.public.drugs4projet',
 value_format = 'avro'
);
CREATE STREAM PHARMA WITH (
    kafka_topic = 'asgard.public.pharm4projet',
    value_format = 'avro'
);

CREATE STREAM BUYERS WITH 
(KAFKA_TOPIC='buyers',VALUE_FORMAT='AVRO');

CREATE STREAM PHARMA_REKEY WITH (PARTITIONS=1) AS SELECT * FROM PHARMA PARTITION BY id;

CREATE TABLE PHARMA_TABLE WITH (KAFKA_TOPIC='PHARMA', VALUE_FORMAT ='AVRO', KEY='id');
