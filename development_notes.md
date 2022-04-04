
### v0.1.0

The default resource list file was generated in the following way:

```
$ oc new-app --template=jenkins-persistent --param=VOLUME_CAPACITY=2Gi --dry-run=true --output=yaml | yq > /tmp/jenkins-new-app-resources.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="Route")' > files/jenkins-Route.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="ConfigMap")' > files/jenkins-trusted-ca-bundle-ConfigMap.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="PersistentVolumeClaim")' > files/jenkins-PersistentVolumeClaim.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="DeploymentConfig")' > files/jenkins-DeploymentConfig.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="ServiceAccount")' > files/jenkins-ServiceAccount.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="RoleBinding")' > files/jenkins_edit-RoleBinding.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="Service") | select(.metadata.name=="jenkins-jnlp")' > files/jenkins-jnlp-Service.yaml
$ cat /tmp/jenkins-new-app-resources.yaml | yq eval '.items[] | select(.kind=="Service") | select(.metadata.name=="jenkins")' > files/jenkins-Service.yaml
```
