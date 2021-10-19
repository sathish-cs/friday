# Friday


Helm Charts are simply like Kubernetes YAML manifests combined into a single package that can be packaged together and easy install it on Kubernetes clusters. 


### Install Helm on Linux

* Download binary [here](https://get.helm.sh/helm-v3.6.1-linux-amd64.tar.gz)
 Unpack it using tar
* Find helm binary and mv to /usr/local/bin

### Helm Charts

```
├── Chart.yaml 
├── charts
├── templates
│   ├── _helpers.tpl
│   ├── hpa.yaml
│   ├── nginx.yaml
│   └── service.yaml
└── values.yaml 
```

### Built-in objects  used in this helm chart

* .Release.Name -  Used to insert the name of the release to the templates, its very usefull while using multiple deployments and easy to identify
* .Chart.Name - This will take values from Chart.yaml 

### Install helm charts

* Clone the repo 
* helm install myapp /github/repo/path/
* helm ls
* helm status myapp - Can see more info like namespace & last deployed time etc
* helm history myapp - Can see the revsions of application and its status
* helm upgrade myapp /github/repo/path/ - Easily it can be upgraded if any changes made to charts
* helm rollback myapp - To revert back to previous version incase of any issues

