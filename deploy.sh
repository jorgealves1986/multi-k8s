docker build -t jorge00alves/multi-client:latest -f ./client/Dockerfile ./client
docker build -t jorge00alves/multi-server:latest -f ./server/Dockerfile ./server
docker build -t jorge00alves/multi-worker:latest -f ./worker/Dockerfile ./worker

docker push jorge00alves/multi-client:latest
docker push jorge00alves/multi-server:latest
docker push jorge00alves/multi-worker:latest

kubectl apply -f k8s
kubectl rollout restart deployments/client-deployment
kubectl rollout restart deployments/server-deployment
kubectl rollout restart deployments/worker-deployment