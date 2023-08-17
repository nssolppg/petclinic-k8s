package petclinic

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]: [string]: v1.#Service
deployment: [string]: [string]: apps_v1.#Deployment

service: [ID=_]: [ENV=_]: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      ENV + "-" + ID
		namespace: ENV
	}
	spec: {
		ports: [{
			port:       8080
			targetPort: 8080
		}]
		selector: app: ID
	}
}
deployment: [ID=_]: [ENV=_]: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      ENV + "-" + ID
		namespace: ENV
	}
	spec: {
		replicas:             1
		revisionHistoryLimit: 3
		selector: matchLabels: app: ID
		template: {
			metadata: labels: app: ID
			spec: containers: [{
				image: "hyasuhisa/spring-petclinic-api-gateway:dadc2ac4293d0679fd17f4f8aed753acfb8caa0e"
				name:  ID
				ports: [{
					containerPort: 8080
				}]
			}]
		}
	}
}
