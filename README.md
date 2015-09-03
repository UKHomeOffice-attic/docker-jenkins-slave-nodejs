# Jenkins Slave Docker Container: NodeJS Build Tools

This container is an Jenkins slave with NodeJS Build Tools. It extends the 
[Jenkins Slave Docker Container][1] by adding NodeJS build tools.

The build tools that this container somes with are

* [Sonar Qube Sonar Runner][runner]
* NodeJS

[1]: https://github.com/UKHomeOffice/docker-jenkins-slave "Jenkins Slave Docker Container"
[runner]: http://docs.sonarqube.org/display/SONAR/Installing+and+Configuring+SonarQube+Runner

## Getting Started

In this section I'll show you some examples of how you might run this container with docker.

### Prerequisities

In order to run this container you'll need docker installed.

* [Windows](https://docs.docker.com/windows/started)
* [OS X](https://docs.docker.com/mac/started/)
* [Linux](https://docs.docker.com/linux/started/)

You'll also need a jenkins master with a node configured on it, that doesn't already have a slave 
connected to it.

There is a guide [on the jenkins wiki on how to do that][2] on how to do that. You'll only need to 
go up to step 4 though.

The Remote FS Root you want will be `/home/jenkins`

[2]: https://wiki.jenkins-ci.org/display/JENKINS/Step+by+step+guide+to+set+up+master+and+slave+machines "Step by step guide to set up master and slave machines"

## Usage

### Container Parameters

This container has two modes of operation, the first is jenkins slave mode.

In this mode you pass the container 3 parameters.

* `jenkins-slave` - To tell the container to run as a jenkins slave
* `http://jenkins-url:5321` - Jenkins URL
* `my-node` - The name you've given the node

This looks look a bit like this in docker

```shell
docker run quay.io/ukhomeofficedigital/jenkins-slave-nodejs:v0.2.0 \
           jenkins-slave \
           http://jenkins-url:5321 \
           my-node
```

The other mode of operation is simply to drop you into a bash shell on the container. For this just
run the command you want to execute as a parameter as normal. 

So if you wanted to run bash, you'd run this 

```shell
docker run quay.io/ukhomeofficedigital/jenkins-slave-nodejs:v0.2.0 \
           bash
```

### Volumes

* `/home/jenkins` - The default location where jenkins things happen.
  
### Kubernetes Example

You can find an example of the ReplicationController you might with this container in 
[examplekb8.rc.yml][3].

[3]: examplekb8.rc.yml "Kubernetes Replication Controller Example"
  
## Find Us

* [GitHub](https://github.com/UKHomeOffice/docker-jenkins-slave-nodejs)
* [Quay.io](https://quay.io/repository/ukhomeofficedigital/jenkins-slave-nodejs)

## Contributing

Feel free to submit pull requests and issues. If it's a particularly large PR, you may wish to 
discuss it in an issue first.

Please note that this project is released with a [Contributor Code of Conduct][4]. By participating 
in this project you agree to abide by its terms.

[4]: code_of_conduct.md "Contributor Code of Conduct"

## Versioning

We use [SemVer][5] for versioning. For the versions available, see the [tags on this repository][6].

[5]: http://semver.org/ "Semantic Versioning 2.0.0"
[6]: https://github.com/UKHomeOffice/docker-jenkins-slave-openjdk8/tags

## Authors

* **Billie Thompson** - *Initial work* - [purplebooth](https://github.com/purplebooth)

See also the list the of [contributors][7] who participated in this project.

[7]: https://github.com/UKHomeOffice/docker-jenkins-slave-openjdk8/graphs/contributors

## License

This project is licensed under the MIT License - see the [LICENSE.md][8] file for details

[8]: LICENSE.md "The MIT License (MIT)"
