{{- define "app.systemlables" }} # defining labels for deployment
  labels:
    env: dev
    project: demo
{{- end }}

{{- define "myapp.systemlables" }} # deployment manages pods using labels
  selector:
      matchLabels:
        env: dev
        project: demo
{{- end }}

{{- define "mypod.systemlables" }} # defining labels for pods
  template:
    metadata:
      labels:
        env: dev
        project: demo
{{- end}}
