package petclinic

#customers_service_service: #Service & {
    _id: "cue-customers-service"
    _port: 8081
    _targetPort: 8081
}

#customers_service_deployment: #Deployment & {
    _id: "cue-customers-service"
	_imageName: "hyasuhisa/spring-petclinic-customers-service:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	_containerPort: 8081
}

service: customers_service: prod: #customers_service_service & { _env: "prod" }

deployment: customers_service: prod: #customers_service_deployment & { _env: "prod" }

service: customers_service: stg: #customers_service_service & { _env: "stg" }

deployment: customers_service: stg: #customers_service_deployment & { _env: "stg" }