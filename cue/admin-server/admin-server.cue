package petclinic

#AdminServerServiceConfig: #ServiceConfig & {
    id: "cue-admin-server"
    port: 9090
    targetPort: 9090
}

#AdminServerDeploymentConfig: #DeploymentConfig & {
    id: "cue-admin-server"
	imageName: "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	containerPort: 9090
}

app: adminServer: prod: {
    service: #Service & { _config: #AdminServerServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #AdminServerDeploymentConfig & { env: "prod" } }
}

app: adminServer: stg: {
    service: #Service & { _config: #AdminServerServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #AdminServerDeploymentConfig & { env: "stg" } }
}