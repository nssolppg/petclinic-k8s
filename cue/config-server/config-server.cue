package petclinic

#config_server_service: #Service & {
    _id: "cue-config-server"
    _port: 8888
    _targetPort: 8888
}

#config_server_deployment: #Deployment & {
    _id: "cue-config-server"
	_imageName: "hyasuhisa/spring-petclinic-config-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	_containerPort: 8888
}

service: config_server: prod: #config_server_service & { _env: "prod" }

deployment: config_server: prod: #config_server_deployment & { _env: "prod" }

service: config_server: stg: #config_server_service & { _env: "stg" }

deployment: config_server: stg: #config_server_deployment & { _env: "stg" }