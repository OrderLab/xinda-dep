docker-compose up -d
sleep 1
docker exec -it roach1 ./cockroach --host=roach1:26357 init --insecure