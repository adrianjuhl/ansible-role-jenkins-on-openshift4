
### v1.0.0

[kubernetes.core](https://docs.ansible.com/ansible/latest/collections/kubernetes/core/index.html) Ansible collection.

### v0.3.0

The .m2/settings.xml file for maven is copied into place using initContainers config in the DeploymentConfig for jenkins. See [Init Containers](https://kubernetes.io/docs/concepts/workloads/pods/init-containers/) kubernetes documentation.

### v0.2.0

* [Configuring Jenkins images in OpenShift4](https://docs.openshift.com/container-platform/4.10/openshift_images/using_images/images-other-jenkins.html)
* [Simplify Jenkins Agents Setup in OpenShift4](https://dale-bingham-soteriasoftware.medium.com/simplify-jenkins-slave-agents-setup-in-openshift-4d62a26eda29)

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
