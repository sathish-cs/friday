# Friday


Helm Charts are simply like Kubernetes YAML manifests combined into a single package that can be packaged together and easy install it on Kubernetes clusters. 

### Prerequisite

This helm chart will deploy Horizontal Pod Autoscaler. HPA fetches metrics like cpu utilization from metrics server, its keep queries for metrics each 15secs (sync period can be adjusted as per requirement) which specified in HPA and scale pods accordingly. It can be used with deployments, statefulsets etc.

Its necessary to install metrics server to work with HPA. 

[To install metrics server](https://github.com/kubernetes-sigs/metrics-server/releases/download/v0.4.3/components.yaml) 

Flags to be add in metrics server deployment

    - --kubelet-insecure-tls=true
    - --kubelet-preferred-address-types=InternalIP

### Install Helm on Linux

* Download binary [here](https://get.helm.sh/helm-v3.6.1-linux-amd64.tar.gz)
* Unpack it using tar
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

* Templates - Its a directory where all yaml mainfest files are stored
* Charts - Used to store sub charts
* values.yaml - Used to provide the values to templates
* Chart.yaml - Used to store information like api version etc

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

### To remove the helm deployment

* helm uninstall myapp

