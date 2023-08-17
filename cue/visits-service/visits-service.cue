package petclinic

#visits_service_service: #Service & {
    _id: "cue-visits-service"
    _port: 8082
    _targetPort: 8082
}

#visits_service_deployment: #Deployment & {
    _id: "cue-visits-service"
	_imageName: "hyasuhisa/spring-petclinic-visits-service:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	_containerPort: 8082
}

service: visits_service: prod: #visits_service_service & { _env: "prod" }

deployment: visits_service: prod: #visits_service_deployment & { _env: "prod" }

service: visits_service: stg: #visits_service_service & { _env: "stg" }

deployment: visits_service: stg: #visits_service_deployment & { _env: "stg" }