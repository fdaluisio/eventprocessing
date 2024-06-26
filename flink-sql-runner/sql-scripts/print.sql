CREATE TABLE KafkaTable (
  `order_number` INT,
  `price` INT
) WITH (
  'connector' = 'kafka',
  'topic' = 'orders',
  'properties.bootstrap.servers' = 'svil-es-kafka-kafka-bootstrap.kafka.svc:9092',
  'properties.group.id' = 'ordersGroup',
  'scan.startup.mode' = 'earliest-offset',
  'format' = 'json',
  'json.ignore-parse-errors' = 'true',
  'properties.sasl.mechanism' = 'SCRAM-SHA-512',
  'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="fd-kafkauser" password="Wnb0mGgaGLkFIc49hvARCyyFRA0ojwNd";'
);

CREATE TABLE out_table WITH ('connector' = 'print')
  LIKE KafkaTable (EXCLUDING ALL);

INSERT INTO out_table SELECT * FROM KafkaTable;

