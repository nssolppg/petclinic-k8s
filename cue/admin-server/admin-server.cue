package petclinic

#admin_server_service: #Service & {
    _id: "cue-admin-server"
    _port: 9090
    _targetPort: 9090
}

#admin_server_deployment: #Deployment & {
    _id: "cue-admin-server"
	_imageName: "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	_containerPort: 9090
}

service: admin_server: prod: #admin_server_service & { _env: "prod" }

deployment: admin_server: prod: #admin_server_deployment & { _env: "prod" }

service: admin_server: stg: #admin_server_service & { _env: "stg" }

deployment: admin_server: stg: #admin_server_deployment & { _env: "stg" }