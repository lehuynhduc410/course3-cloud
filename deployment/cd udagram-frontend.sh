cd udagram-frontend
docker build . --platform=linux/amd64 -t duclh410/udagram-frontend:v12
docker push duclh410/udagram-frontend:v12

cd ..
cd udagram-api-user
docker build . --platform=linux/amd64 -t duclh410/udagram-api-user:latest
docker push duclh410/udagram-api-user:latest

cd ..
cd udagram-api-feed
docker build . --platform=linux/amd64 -t duclh410/udagram-api-feed:latest
docker push duclh410/udagram-api-feed:latest

cd ..
cd udagram-reverseproxy
docker build . --platform=linux/amd64 -t duclh410/udagram-reverseproxy:latest
docker push duclh410/udagram-reverseproxy:latest


kubectl set image deployment frontend frontend=duclh410/udagram-frontend:latest
kubectl expose deployment reverseproxy --type=LoadBalancer --name=publicreverseproxy



aws eks update-kubeconfig --region us-east-1 --name udagram

kubectl set image deployment frontend frontend=duclh410/udagram-frontend:v12
