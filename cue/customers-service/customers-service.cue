package petclinic

#CustomersServiceServiceConfig: #ServiceConfig & {
    id: "cue-customers-service"
    port: 8081
    targetPort: 8081
}

#CustomersServiceDeploymentConfig: #DeploymentConfig & {
    id: "cue-customers-service"
    imageName: "hyasuhisa/spring-petclinic-customers-service:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
    containerPort: 8081
}

app: customersService: prod: {
    service: #Service & { _config: #CustomersServiceServiceConfig & { env: "prod" } }
    deployment: #Deployment & { _config: #CustomersServiceDeploymentConfig & { env: "prod" } }
}

app: customersService: stg: {
    service: #Service & { _config: #CustomersServiceServiceConfig & { env: "stg" } }
    deployment: #Deployment & { _config: #CustomersServiceDeploymentConfig & { env: "stg" } }
}