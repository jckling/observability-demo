# observability-demo

TODO：
- kubectl/helm：promail + consul + demo
- k8s: rolebinding, ingress authentication
- docker：通过 promtail 发送容器日志到 loki（缺点：不同系统路径可能不同，目前使用 loki docker plugin 发送容器日志数据）

## 参阅
- [Alertmanager Configuration](https://prometheus.io/docs/alerting/latest/configuration/)
- [Prometheus Configuration](https://prometheus.io/docs/prometheus/latest/configuration/configuration/)
- [Configure Grafana | Grafana documentation](https://grafana.com/docs/grafana/latest/setup-grafana/configure-grafana/)
- [Provision Grafana | Grafana documentation](https://grafana.com/docs/grafana/latest/administration/provisioning/)
- [Service - Agent - HTTP API | Consul | HashiCorp Developer](https://developer.hashicorp.com/consul/api-docs/agent/service)
- [Grafana Loki HTTP API | Grafana Loki documentation](https://grafana.com/docs/loki/latest/reference/api/)
- [Configure Promtail | Grafana Loki documentation](https://grafana.com/docs/loki/latest/send-data/promtail/configuration/)
