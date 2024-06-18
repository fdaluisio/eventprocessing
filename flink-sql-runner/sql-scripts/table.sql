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
  'properties.ssl.truststore.certificates' = '-----BEGIN CERTIFICATE-----
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
-----END CERTIFICATE-----
,-----BEGIN CERTIFICATE-----
MIIFLTCCAxWgAwIBAgIUYPhKQMRtOJcbkqFZvTuRUq4orPcwDQYJKoZIhvcNAQENBQAwLTETMBEGA1UECgwKaW8uc3RyaW16aTEWMBQGA1UEAwwNY2x1c3Rlci1jYSB2MDAeFw0yNDA2MTQxNjI4MzhaFw0yNDA5MTIxNjI4MzhaMC0xEzARBgNVBAoMCmlvLnN0cmltemkxFjAUBgNVBAMMDWNsdXN0ZXItY2EgdjAwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDbDiZprXHcj07iWxFepWqXIVvaIYqux7vV3aVXEcJd8Bgc5iiTZwD1QviDPMF42KzegrPghyWZVzd7kuT09QLg0349pjqev3Vic2ymnE4fu0sHR7JfCiNcZWg7hF2we9gs8Hdd4tXDNTFdX8yFmA2Gl4Xp8huZEHY3leDTbrTYzrRMtbyRAhYPQTe/zMJ/XxAGJNqKFxWk60bSDiR2y/W81Y+dWAnMSEucsPyqRzfVeYtpBXqPzsNgl5H2VwHkWp140lFFmafKFE3Oz7xE7ryQ2FkeV1x2xnDLDtwydTEnEghKdWjAg14vZ6CwKNWMY3IFwe1wn+BiW8RpiuGR/Rh+BG24IhaavSrY6HIRdeNz3ARCpjCMM5YX9YO9EsFlEeFSJdkehiIzMiopmG8L/1/UrVftOB2qONeArP3l9x2uZiQYjjp2p0bCKBRBrU68Xp6jnRtoevYMVPOEQUQnaf671+D+HzTznTZi+GGYsuSxZMhHdWUzhe8YAHLDuF/m3YAdVocLOjkIQeBWLP6DBaM1VF+sNGnMBfAc1iw6R8Phk2veFd94xnFVccgUkPt0pnhirCp9PxULoSuG3/yJNF1Mwd95/Um1626Lzo429ePbfMzVDkT4kGh3/r0b0yiNc+B6yl/7ihilBVQqAdwygmEi9JFAApzb2KOHwFIqiMzZcwIDAQABo0UwQzAdBgNVHQ4EFgQUWIO/bCBl0UjIw/hvs9Tz83swXQwwEgYDVR0TAQH/BAgwBgEB/wIBADAOBgNVHQ8BAf8EBAMCAQYwDQYJKoZIhvcNAQENBQADggIBAJ/4JQ0dUQrzpSny5kKZfbgBBxpDQzKfefgIgkkY0TJyXiwBLdEF91xm/uk1C/UTPmFHG3uDJnwKsebjZaDPbxtj6Wb92EAkPFV5mlTxgyHQN5F524goci3728yIjx9SAUKx1Dxtx1NkLTqhBrt3yTLiqzzhknPgBm91TvrTavOAj8unb9Q52UqbGSsU18b0AlqLYzjQjUX6SG+g8dDPT2nR3UG8s4V/l/IvVUF7K6m6sDzziQLT+Xn5QwDCBoVFzJKWJCVWR31CC2gZydm5Olj2UMmS5Fp4pwVcSlRmvblFRLvkgL8wgX13eQc7Ih6Hh74dNkemClyL1glLowNifUubTjyGc8vWtrxr33JWKWSRfYcN530OpjROy/phRrZ7L9r23x5GvTJ5EZ5oRQ1kYZXg76DbQ6Vc6iK6jN12qfBnUlxQCqVzLhj0FBG9NBrXu2vcQ3njLd1eZjz7UnjKdoM9VU3VxTzTxAJbNo1Kw3IQdieEY1jgB0h6r6p1YjgcY3CyECFlMiVFLqqY75R3e9N03RJYcZhn5OieQwwADviWj0bkSlMtcLMPRyPLl+SrsfmSaehPDHi3PeOP9QpldREyGOFl8QFKVdrKAuGqprCHYpmpztN7229JHx8OqsUiGBVuIPa7IBHmCknpTdGkQhvzU9w2k52EWpSo+3tus6Wq
-----END CERTIFICATE-----
',
  'properties.security.protocol' = 'SASL_SSL',
  'properties.sasl.mechanism' = 'SCRAM-SHA-512',
  'properties.sasl.jaas.config' = 'org.apache.kafka.common.security.scram.ScramLoginModule required username="fd-kafkauser" password="Wnb0mGgaGLkFIc49hvARCyyFRA0ojwNd";'
);

INSERT INTO KafkaTable SELECT * FROM orders;
