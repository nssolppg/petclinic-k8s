{
  apiVersion: "apps/v1"
  kind: "Deployment"
  metadata: name: "prod-admin-server-cue"
  namespace: "petclnic-prod"
  spec: {
    replicas: 1
    revisionHistoryLimit: 3
    selector: matchLabels: app: "prod-admin-server-cue"
    template: {
      metadata: labels: app: "prod-admin-server-cue"
      spec: containers: [
        {
          image: "hyasuhisa/spring-petclinic-admin-server:c53f193561c7631f6e7dde485b8ccbfdbef9d5f3"
          name: "prod-admin-server-cue"
          ports: [
            {
              containerPort: 9090
            }
          ]
        }
      ]
    }
  }
}