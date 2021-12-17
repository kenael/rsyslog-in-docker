## Simple Docker Container with Rsyslog and Logrotate

Simple Docker-Configuration with Rsyslog-Server.  

For Test or Home Environments.

Usage:
```
git clone https://github.com/kenael/rsyslog-in-docker.git
cd rsyslog-in-docker/
docker build -t rsyslog:lcl .
docker run -d --restart=always --name rsyslog --network host -v $PWD/data:/var/log rsyslog:lcl
```
Alternative to Docker run:
```
docker-compose up --build -d
```

> **Notice:**  
> You can also use Docker Stack, Kubernetes or comparable Solutions.  
> The only problem is that the log files start with the gateway IP address from the Ochestration.  
> You can change the Template Configuration rsyslog_server.conf.  

Path-Structure:
```
data
└── hosts
```

All Logs stored in 'syslog' and 'hosts/<IP_Hostname>.log'.  

Default Port 1514 with udp and tcp, you can change it in rsyslog_server.conf or you replace '--network host' with Example Option '-p ≤Your Port>:1514/udp'.  *See the Note above.*  

