package petclinic

#vets_service_service: #Service & {
    _id: "cue-vets-service"
    _port: 8083
    _targetPort: 8083
}

#vets_service_deployment: #Deployment & {
    _id: "cue-vets-service"
	_imageName: "hyasuhisa/spring-petclinic-vets-service:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	_containerPort: 8083
}

service: vets_service: prod: #vets_service_service & { _env: "prod" }

deployment: vets_service: prod: #vets_service_deployment & { _env: "prod" }

service: vets_service: stg: #vets_service_service & { _env: "stg" }

deployment: vets_service: stg: #vets_service_deployment & { _env: "stg" }