docker build -t adamgouldmig/multi-client:latest -t adamgouldmig/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t adamgouldmig/multi-server:latest -t adamgouldmig/multi-server:$SHA -f ./server/Dockerfile ./server
docker build -t adamgouldmig/multi-worker:latest adamgouldmig/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker push adamgouldmig/multi-client:latest
docker push adamgouldmig/multi-server:latest
docker push adamgouldmig/multi-worker:latest
docker push adamgouldmig/multi-client:$SHA
docker push adamgouldmig/multi-server:$SHA
docker push adamgouldmig/multi-worker:$SHA
# kubectl apply -f k8s
# kubectl set image deployments/server-deployment server=adamgouldmig/multi-server:$SHA
# kubectl set image deployments/client-deployment client=adamgouldmig/multi-client:$SHA
# kubectl set image deployments/worker-deployment worker=adamgouldmig/multi-worker:$SHA