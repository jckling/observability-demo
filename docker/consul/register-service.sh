#!/bin/bash

services=("prometheus" "pushgateway" "alertmanager" "grafana" "loki")

Register()
{
    for service in ${services[@]}; do
        filename=$service".json"
        curl -X PUT --data @$filename http://localhost:8500/v1/agent/service/register
    done
}

Deregister()
{
    for service in ${services[@]}; do
        curl -X PUT http://localhost:8500/v1/agent/service/deregister/$service
    done
}

while getopts "rd" option; do
   case $option in
    r)
        Register
        exit;;
    d)
        Deregister
        exit;;
   esac
done
