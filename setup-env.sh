# Install k8s cluster
k3d cluster create --api-port 6550 -p '9080:80@loadbalancer' -p '9443:443@loadbalancer' --agents 2 --k3s-arg '--disable=traefik@server:*'

# Install Istio ambient
istioctl install --set profile=ambient --skip-confirmation  --set values.cni.cniConfDir=/var/lib/rancher/k3s/agent/etc/cni/net.d --set values.cni.cniBinDir=/bin --set meshConfig.accessLogFile=/dev/stdout

kubectl get crd gateways.gateway.networking.k8s.io &> /dev/null || \
  { kubectl apply -f https://github.com/kubernetes-sigs/gateway-api/releases/download/v1.1.0/standard-install.yaml; }

ISTIO_DOWNLOAD_DIR=~/Downloads/istio-1.23.0
kubectl apply -f $ISTIO_DOWNLOAD_DIR/samples/addons/prometheus.yaml
kubectl apply -f $ISTIO_DOWNLOAD_DIR/samples/addons/kiali.yaml
