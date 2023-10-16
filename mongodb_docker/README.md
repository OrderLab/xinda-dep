


## Launch database & init replica set
```
./up.sh
```
## Shut down database & prune volume
```
./down.sh
```

## DB operations
```
show dbs
db.mycoll.insert({name: "Max"})
db.mycoll.insertMany([{name: "Bob"}, {name:"Alex"}])
db.mycoll.find()
db.mycoll.replaceOne({"name": "Max"}, {"firstname": "Maxime", "surname": "Beugnet"})
db.mycoll.deleteOne({name: "Bob"})
db.mycoll.find({})
db.mycoll.deleteMany({})
db.mycoll.find({})
```

```
db.getMongo().setReadPref("primaryPreferred")
docker stop mongodb1
docker start mongodb1
```

## WIP
1. ycsb fails both load & run for async driver (no hypothetical cause) ❌
2. ycsb can load successfully with sync driver ✅
3. ycsb run workload successfully only when `mongodb.url` connection string is set default or to be the primary node without replica form (`mongodb://localhost:27017`). ✅ However, it fails for the connection string that represents the whole replication set (`mongodb://localhost:27017,localhost:27018,localhost:27019,localhost:27020/?authSource=admin&replicaSet=rs0`). ❌
    - Within the debugging process, pymongo is also used to try connecting mongo servers. It can connect standalone servers. But it cannot connect any server of the replica set, no matter primary or secondary. 👎