curl -X POST -d '{"port_name": "s1-eth2", "type": "linux-htb", "max_rate": "10000000", "queues": [{"max_rate": "5000000}, {"min_rate": "800000"}]}' http://localhost:8080/qos/queue/0000000000000001

