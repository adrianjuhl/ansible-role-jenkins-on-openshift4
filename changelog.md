
### v1.3.0

Introduce the ability to configure the post-initialization (init) groovy hook scripts.

### v1.2.0

Introduce the ability to configure the timezone for the jenkins server and maven agent pods.

### v1.1.0

Introduce the ability to configure the In-Process Script Approvals (scriptApproval.xml) file.

### v1.0.1

Facilitate ansible check mode:
- command tasks that make no changes and only gather information have been updated with 'check_mode: false' option to allow them to run during normal mode and check mode runs

### v1.0.0

 - Switched to use the kubernetes.core.k8s ansible module to configure resources, rather than use 'oc apply'.
 - Switched to use ansible features to apply parameterized configuration, rather than use search and replace techniques with tools such as yq and sed.

### v0.7.0

Introduced the ability to specify the source jenkins-agent-maven image (the ImageStreamTag name and namespace).

### v0.6.0

Introduced the ability to specify the source jenkins image (the ImageStreamTag name and namespace), giving the ability to lock down the image version and thus control when a new version is rolled out.

### v0.5.0

Introduced the ability to configure addition plugins to install with Jenkins.

### v0.4.0

Introduced the ability to configure the size and storage class of the PersistentVolumeClaims.
 
### v0.3.0

Add maven settings.xml file with configurable servers and mirror elements.

### v0.2.0

Added config for the jenkins-agent-maven Pod Template.
Added config for a PVC to be used as the .m2 directory by maven agent pods.

### v0.1.0

Initial implementation of the role.
