# Ansible role: jenkins_on_openshift4

Configures Jenkins in an OpenShift 4 namespace.

## Requirements

None.

## Role Variables

Available role variables are listed below, along with default values:

**openshift_server_url**

    adrianjuhl__jenkins_on_openshift4__openshift_server_url: "https://api.crc.testing:6443"

The REST API URL of the OpenShift4 server on which Jenkins is to be configured.

**openshift_namespace_jenkins**

    adrianjuhl__jenkins_on_openshift4__openshift_namespace_jenkins: "jenkins"

The name of the namespace in which Jenkins is to be configured.

**jenkins_source_imagestreamtag_name**

    adrianjuhl__jenkins_on_openshift4__jenkins_source_imagestreamtag_name: "jenkins:2"

The name of the the ImageStreamTag to identify the source image for jenkins.

**jenkins_source_imagestreamtag_namespace**

    adrianjuhl__jenkins_on_openshift4__jenkins_source_imagestreamtag_namespace: "openshift"

The namespace that contains the source ImageStream for jenkins.

**jenkins_pvc_storage_size**

    adrianjuhl__jenkins_on_openshift4__jenkins_pvc_storage_size: "1G"

The amount of storage to allocate for Jenkins own application and data.

**jenkins_pvc_storage_class_name**

    adrianjuhl__jenkins_on_openshift4__jenkins_pvc_storage_class_name: ""

The storage class to use for the storage for Jenkins.

**jenkins_install_plugins**

    adrianjuhl__jenkins_on_openshift4__jenkins_install_plugins: ""

Specifies additional Jenkins plugins to install. Plugins are specified as a comma-delimited list of name:version pairs. For example: `"pipeline-utility-steps:2.12.0,workflow-cps:2660.vb_c0412dc4e6d"`

**jenkins_script_approval_xml_file_content**

    adrianjuhl__jenkins_on_openshift4__jenkins_script_approval_xml_file_content: "{{ lookup('file', 'adrianjuhl__jenkins_on_openshift4__scriptApproval.xml') }}"

The file content with which to configure Jenkins's scriptApproval.xml file.

**jenkins_timezone**

    adrianjuhl__jenkins_on_openshift4__jenkins_timezone: "UTC"

The timezone with which to configure jenkins and agent pods.

**jenkins_agent_maven_source_imagestreamtag_name**

    adrianjuhl__jenkins_on_openshift4__jenkins_agent_maven_source_imagestreamtag_name: "jenkins-agent-maven:latest"

The name of the the ImageStreamTag to identify the source image for maven agent pods.

**jenkins_agent_maven_source_imagestreamtag_namespace**

    adrianjuhl__jenkins_on_openshift4__jenkins_agent_maven_source_imagestreamtag_namespace: "openshift"

The namespace that contains the source ImageStream for maven agent pods.

**jenkins_agent_maven_dotm2_directory_pvc_storage_size**

    adrianjuhl__jenkins_on_openshift4__jenkins_agent_maven_dotm2_directory_pvc_storage_size: "1G"

The amount of storage to allocate for use as the .m2 directory on the maven agent pods.

**jenkins_agent_maven_dotm2_directory_pvc_storage_class_name**

    adrianjuhl__jenkins_on_openshift4__jenkins_agent_maven_dotm2_directory_pvc_storage_class_name: ""

The storage class to use for the storage for the .m2 directory on the maven agent pods.

**maven_settings_server1**

    adrianjuhl__jenkins_on_openshift4__maven_settings_server1: "<!-- No server1 is configured. -->"

The server element (first of up to three) to be used in the .m2/settings.xml file of maven agent pods.

**maven_settings_server2**

    adrianjuhl__jenkins_on_openshift4__maven_settings_server2: "<!-- No server2 is configured. -->"

The server element (second of up to three) to be used in the .m2/settings.xml file of maven agent pods.

**maven_settings_server3**

    adrianjuhl__jenkins_on_openshift4__maven_settings_server3: "<!-- No server3 is configured. -->"

The server element (third of up to three) to be used in the .m2/settings.xml file of maven agent pods.

**maven_settings_mirror**

    adrianjuhl__jenkins_on_openshift4__maven_settings_mirror: "<!-- No mirror is configured. -->"

The mirror element to be used in the .m2/settings.xml file of maven agent pods.

**allow_pvc_reconfiguration**

    adrianjuhl__jenkins_on_openshift4__allow_pvc_reconfiguration: true

Allow the PVCs that are provisioned for Jenkins to be reconfigured, to facilitate, for example, PVC size increases.

## Dependencies

None.

## Example Playbook
```
- hosts: servers
  roles:
    - { role: adrianjuhl.jenkins_on_openshift4 }

or

- hosts: servers
  tasks:
    - name: Install Jenkins on OpenShift4
      include_role:
        name: adrianjuhl.jenkins_on_openshift4
```

## Extras

### Install script

For convenience, a bash script is also supplied that facilitates running this role in order to install Jenkins to a particular namespace.

The script can be run like this:
```
$ git clone git@github.com:adrianjuhl/ansible-role-jenkins-on-openshift4.git
$ cd ansible-role-jenkins-on-openshift4
$ .extras/bin/configure_jenkins_on_openshift4.sh
```

## License

MIT

## Author Information

[Adrian Juhl](http://github.com/adrianjuhl)
