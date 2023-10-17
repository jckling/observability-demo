#!/bin/bash

Push()
{
    cat <<EOF | curl --data-binary @- http://monitoring.unity.com/pushgateway/metrics/job/some_job
# TYPE some_metric counter
some_metric 31
EOF

    cat <<EOF | curl --data-binary @- http://monitoring.unity.com/pushgateway/metrics/job/some_job/instance/some_instance
# TYPE some_metric counter
some_metric{label="val1"} 42
# TYPE another_metric gauge
# HELP another_metric Just an example.
another_metric 2398.283
EOF
}


Delete()
{
    curl -X DELETE http://monitoring.unity.com/pushgateway/metrics/job/some_job
    curl -X DELETE http://monitoring.unity.com/pushgateway/metrics/job/some_job/instance/some_instance
}

while getopts "pd" option; do
   case $option in
    p)
        Push
        exit;;
    d)
        Delete
        exit;;
   esac
done
