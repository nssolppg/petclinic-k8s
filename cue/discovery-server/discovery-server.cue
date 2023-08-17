package petclinic

#discovery_server_service: #Service & {
    _id: "cue-discovery-server"
    _port: 8761
    _targetPort: 8761
}

#discovery_server_deployment: #Deployment & {
    _id: "cue-discovery-server"
	_imageName: "hyasuhisa/spring-petclinic-discovery-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	_containerPort: 8761
}

service: discovery_server: prod: #discovery_server_service & { _env: "prod" }

deployment: discovery_server: prod: #discovery_server_deployment & { _env: "prod" }

service: discovery_server: stg: #discovery_server_service & { _env: "stg" }

deployment: discovery_server: stg: #discovery_server_deployment & { _env: "stg" }