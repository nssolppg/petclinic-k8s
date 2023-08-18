package petclinic

#VisitsServiceServiceConfig: #ServiceConfig & {
    id: "cue-visits-service"
    port: 8082
    targetPort: 8082
}

#VisitsServiceDeploymentConfig: #DeploymentConfig & {
    id: "cue-visits-service"
	imageName: "hyasuhisa/spring-petclinic-visits-service:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	containerPort: 8082
}

app: visitsService: prod: {
    service: #Service & { _config: #VisitsServiceServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #VisitsServiceDeploymentConfig & { env: "prod" } }
}

app: visitsService: stg: {
    service: #Service & { _config: #VisitsServiceServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #VisitsServiceDeploymentConfig & { env: "stg" } }
}