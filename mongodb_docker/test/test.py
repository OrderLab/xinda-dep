import pymongo
from pymongo.mongo_client import MongoClient
# Define the replica set connection string

# Create a MongoClient instance with the replica set connection string
# uri = "mongodb://172.18.0.2:27017,172.18.0.3:27017,172.18.0.4:27017,172.18.0.5:27017/?authSource=admin&replicaSet=rs0"
# uri = "mongodb://localhost:27017,localhost:27018,localhost:27019,localhost:27020/?authSource=admin&replicaSet=rs0"
uri = "localhost:27017"
client = MongoClient(uri)
# replica_set_members = [
#     "localhost:27017",
#     "localhost:27018",
#     "localhost:27019",
#     "localhost:27020",
# ]

# Create a connection to the replica set
# client = MongoClient(
#     ",".join(replica_set_members),
#     replicaSet="rs0",
# )

# client = pymongo.MongoClient("localhost", 27015)
print("!!")
# # Access a database and collection
db = client['ycsb']  # Replace with your database name
collection = db['usertable']  # Replace with your collection name
total_entries = collection.count_documents({})
print("!!", total_entries)
# # Perform MongoDB operations
result = collection.find({})

for _ in result:
    print(_)

# database_names = client.list_database_names()


# # Print the list of database names
# for db_name in database_names:
#     print(db_name)

# # Disconnect from the MongoDB server
# client.close()
