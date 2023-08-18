package petclinic

#DiscoveryServerServiceConfig: #ServiceConfig & {
    id: "cue-discovery-server"
    port: 8761
    targetPort: 8761
}

#DiscoveryServerDeploymentConfig: #DeploymentConfig & {
    id: "cue-discovery-server"
	imageName: "hyasuhisa/spring-petclinic-discovery-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
	containerPort: 8761
}

app: discoveryServer: prod: {
    service: #Service & { _config: #DiscoveryServerServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #DiscoveryServerDeploymentConfig & { env: "prod" } }
}

app: discoveryServer: stg: {
    service: #Service & { _config: #DiscoveryServerServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #DiscoveryServerDeploymentConfig & { env: "stg" } }
}