package petclinic

#VetsServiceServiceConfig: #ServiceConfig & {
    id: "cue-vets-service"
    port: 8083
    targetPort: 8083
}

#VetsServiceDeploymentConfig: #DeploymentConfig & {
    id: "cue-vets-service"
	imageName: "hyasuhisa/spring-petclinic-vets-service:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	containerPort: 8083
}

app: vetsService: prod: {
    service: #Service & { _config: #VetsServiceServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #VetsServiceDeploymentConfig & { env: "prod" } }
}

app: vetsService: stg: {
    service: #Service & { _config: #VetsServiceServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #VetsServiceDeploymentConfig & { env: "stg" } }
}