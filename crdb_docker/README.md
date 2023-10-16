


## Launch database & init replica set
```
./up.sh
```
## Shut down database & prune volume
```
./down.sh
```
## Check cluster node status
```
./status.sh
```
The database takes some time to initialize cluster nodes. If you check status immediately after `./up.sh`, it normally fails. Try again in a few seconds.
## Connect to sql
You can connect to sql of `sql_host_id` from container `docker_id`:
```
./sql.sh [docker_id] [sql_host_id]
```
The following two commands are equivalent.
```
./sql.sh 1 2
docker exec -it roach1 ./cockroach sql --host=roach2:26257 --insecure
```

## DB operations
```
CREATE DATABASE bank;
CREATE TABLE bank.accounts (id INT PRIMARY KEY, balance DECIMAL);
INSERT INTO bank.accounts VALUES (1, 1000.50);
INSERT INTO bank.accounts VALUES (2, 2000.50);
SELECT * FROM bank.accounts;
DELETE FROM bank.accounts WHERE id = 2;
```

## Run workload