# Install k8s cluster
k3d cluster create --api-port 6550 -p '9080:80@loadbalancer' -p '9443:443@loadbalancer' --agents 2 --k3s-arg '--disable=traefik@server:*'

# Install Istio ambient
istioctl install --set profile=ambient --skip-confirmation  --set values.cni.cniConfDir=/var/lib/rancher/k3s/agent/etc/cni/net.d --set values.cni.cniBinDir=/bin --set meshConfig.accessLogFile=/dev/stdout
kubectl create namespace monitoring
kubectl apply -f ~/istio-1.22.0/prometheus.yaml
kubectl apply -f ~/istio-1.22.0/kiali.yaml

kubectl create namespace monitoring
kubectl apply -f ~/istio-1.22.0/prometheus.yaml
kubectl apply -f ~/istio-1.22.0/kiali.yaml
