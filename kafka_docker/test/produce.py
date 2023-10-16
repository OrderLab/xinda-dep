from kafka import KafkaProducer

# Define Kafka broker and topic details
kafka_broker = "localhost:9092"  # Replace with your Kafka broker address
kafka_topic = "my-topic"         # Replace with the name of your Kafka topic

# Create a Kafka producer instance
producer = KafkaProducer(bootstrap_servers=kafka_broker)

# Produce a message to the Kafka topic
key = b'key'
value = b'Hello, Kafka from Python!'
producer.send(kafka_topic, key=key, value=value)

# Close the producer to ensure all messages are sent
producer.close()
