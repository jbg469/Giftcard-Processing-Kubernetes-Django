minikube stop
minikube start

eval $(minikube docker-env)


docker build -t nyuappsec/assign3:v0 .
docker build -t nyuappsec/assign3-proxy:v0 proxy/
docker build -t nyuappsec/assign3-db:v0 db/

kubectl apply -f GiftcardSite/GiftcardSite/namespace-dev.json
kubectl config set-context dev --namespace=development --cluster=minikube --user=minikube
kubectl config use-context dev

kubectl apply -f GiftcardSite/GiftcardSite/namespace-dev.json
kubectl apply -f db/k8
kubectl apply -f GiftcardSite/k8
kubectl apply -f proxy/k8