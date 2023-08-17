package petclinic

#api_gateway_service: #Service & {
    _id: "cue-api-gateway"
    _port: 8080
    _targetPort: 8080
}

#api_gateway_deployment: #Deployment & {
    _id: "cue-api-gateway"
	_imageName: "hyasuhisa/spring-petclinic-api-gateway:dadc2ac4293d0679fd17f4f8aed753acfb8caa0e"
	_containerPort: 8080
}

service: api_gateway: prod: #api_gateway_service & { _env: "prod" }

deployment: api_gateway: prod: #api_gateway_deployment & { _env: "prod" }

service: api_gateway: stg: #api_gateway_service & { _env: "stg" }

deployment: api_gateway: stg: #api_gateway_deployment & { _env: "stg" }