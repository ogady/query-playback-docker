# query-playback-docker

Using this tool to run [percona/query-playback](https://github.com/Percona-Lab/query-playback) on docker.

## usage
Put the slowquery log in the slowquery directory

```
docker-compose up -d
docker exec -it {container_id} sh
```

All that is left is to type the percona-playback command in docker, specifying the slowquery log.
