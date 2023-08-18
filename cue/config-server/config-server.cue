package petclinic

#ConfigServerServiceConfig: #ServiceConfig & {
    id: "cue-config-server"
    port: 8888
    targetPort: 8888
}

#ConfigServerDeploymentConfig: #DeploymentConfig & {
    id: "cue-config-server"
	imageName: "hyasuhisa/spring-petclinic-config-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	containerPort: 8888
}

app: configServer: prod: {
    service: #Service & { _config: #ConfigServerServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #ConfigServerDeploymentConfig & { env: "prod" } }
}

app: configServer: stg: {
    service: #Service & { _config: #ConfigServerServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #ConfigServerDeploymentConfig & { env: "stg" } }
}