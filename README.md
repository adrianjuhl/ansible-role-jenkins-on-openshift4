# Ansible role: jenkins_on_openshift4

Installs Jenkins into an OpenShift 4 namespace.

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
