# remove container
docker stop registry
docker rm registry

# start container
docker run \
  -p 5000:5000 \
  -v /home/docker/registry:/var/lib/registry \
  --name registry \
  -d \
  --restart always \
  registry:latest
