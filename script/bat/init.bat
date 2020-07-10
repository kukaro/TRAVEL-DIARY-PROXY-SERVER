::run docker
docker build -t travel-diary-proxy-server-project ../../project/
HOST_IP=192.168.0.138 docker-compose -f ../../project/docker-compose.yml up -d
