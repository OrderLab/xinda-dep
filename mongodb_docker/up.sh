docker-compose up -d
sleep 1
docker cp ./init/init.sh mongodb1:/init.sh
sleep 1
docker exec -it mongodb1 bash /init.sh