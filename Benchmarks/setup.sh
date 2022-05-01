minikube stop
minikube start

eval $(minikube docker-env)
cd ~/AppSec3


docker build -t nyuappsec/assign3:v0 .
docker build -t nyuappsec/assign3-proxy:v0 proxy/
docker build -t nyuappsec/assign3-db:v0 db/



kubectl apply -f Benchmarks/namespace.json
kubectl apply -f db/k8
kubectl apply -f GiftcardSite/k8
kubectl apply -f proxy/k8

minikube service proxy-service --namespace=jbg469

asgiref==3.2.10
