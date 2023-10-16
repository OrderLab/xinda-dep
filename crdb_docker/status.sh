docker_id=${1:-1}
node_id=${2:-$docker_id}
docker exec -it roach$docker_id ./cockroach node status --host=roach$node_id:26257 --insecure
