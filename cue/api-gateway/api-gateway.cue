package petclinic

#ApiGatewayServiceConfig: #ServiceConfig & {
    id: "cue-api-gateway"
    port: 8080
    targetPort: 8080
}

#ApiGatewayDeploymentConfig: #DeploymentConfig & {
    id: "cue-api-gateway"
	imageName: "hyasuhisa/spring-petclinic-api-gateway:dadc2ac4293d0679fd17f4f8aed753acfb8caa0e"
	containerPort: 8080
}

app: apiGateway: prod: {
    service: #Service & { _config: #ApiGatewayServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #ApiGatewayDeploymentConfig & { env: "prod" } }
}

app: apiGateway: stg: {
    service: #Service & { _config: #ApiGatewayServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #ApiGatewayDeploymentConfig & { env: "stg" } }
}