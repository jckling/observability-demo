# observability-demo

## 环境

Windows + WSL + Minikube + Helm

## kubectl 搭建

创建命名空间

```bash
kubectl create namespace monitoring
kubectl get namespaces
```

搭建 prometheus + pushgateway + alertmanager + grafana

进入 `observability-demo/k8s/kubectl` 目录

```bash
# role
kubectl create -f role.yaml
kubectl get clusterrolebindings

# pvc
kubectl create -f pvc.yaml
kubectl get pvc -n monitoring

# configmap
kubectl create -f configmap.yaml
kubectl get configmaps -n monitoring

# deployment
kubectl create -f deployment.yaml
kubectl get deployments -n monitoring
kubectl get pods -n monitoring

# service
kubectl create -f service.yaml
kubectl get services -n monitoring

# port-forward
kubectl get pods -n monitoring
kubectl port-forward grafana-68768c78b7-4spss 3000:3000 -n monitoring
```

删除

```bash
kubectl delete -f service.yaml
kubectl delete -f deployment.yaml
kubectl delete -f configmap.yaml
kubectl delete -f pvc.yaml
```

## 常用命令

```bash
# 查看资源状态
kubectl describe pvc prometheus-pvc -n monitoring
kubectl describe pod prometheus -n monitoring

# 查看日志
kubectl logs grafana-68768c78b7-4spss -n monitoring

# 查看输出
kubectl attach grafana-68768c78b7-4spss -n monitoring

# shell
kubectl exec -it grafana-68768c78b7-4spss  -n monitoring -- /bin/bash
```

## 测试

需要手动指定端口转发

部署地址
- Prometheus: http://localhost:9090
- Pushgateway: http://localhost:9091
- Alertmanager: http://localhost:9093
- Grafana: http://localhost:3000
  - username: `admin`
  - password: `grafana`

## 参阅

kubectl
- [How To Setup Prometheus Monitoring On Kubernetes [Tutorial]](https://devopscube.com/setup-prometheus-monitoring-on-kubernetes/)
