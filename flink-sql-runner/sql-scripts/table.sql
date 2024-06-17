CREATE TABLE orders (
  order_number INT,
  price        INT
) WITH (
  'connector' = 'datagen',
  'rows-per-second' = '1',
  'fields.order_number.kind' = 'sequence',
  'fields.order_number.start' = '1',
  'fields.order_number.end' = '1000000',
  'fields.price.min' = '1000',
  'fields.price.max' = '1500'
);

CREATE TABLE KafkaTable (
  `order_number` BIGINT,
  `price` BIGINT
) WITH (
  'connector' = 'kafka',
  'topic' = 'orders',
  'properties.bootstrap.servers' = 'svil-es-kafka-kafka-bootstrap.kafka.svc:9092',
  'properties.group.id' = 'ordersGroup',
  'scan.startup.mode' = 'earliest-offset',
  'format' = 'json',
  'json.ignore-parse-errors' = 'true',
  'properties.security.protocol' = 'SASL_PLAINTEXT',
  'properties.sasl.mechanism' = 'SCRAM-SHA-512',
  'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="fd-kafkauser" password="Wnb0mGgaGLkFIc49hvARCyyFRA0ojwNd";'
);

INSERT INTO KafkaTable SELECT * FROM orders;
