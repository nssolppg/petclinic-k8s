package petclinic

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: v1.#Service
deployment: apps_v1.#Deployment

service: {
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      "cue-prod-api-gateway"
		namespace: "prod"
	}
	spec: {
		ports: [{
			port:       8080
			targetPort: 8080
		}]
		selector: app: "api-gateway"
	}
}
deployment: {
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      "cue-prod-api-gateway"
		namespace: "prod"
	}
	spec: {
		replicas:             1
		revisionHistoryLimit: 3
		selector: matchLabels: app: "api-gateway"
		template: {
			metadata: labels: app: "api-gateway"
			spec: containers: [{
				image: "hyasuhisa/spring-petclinic-api-gateway:dadc2ac4293d0679fd17f4f8aed753acfb8caa0e"
				name:  "api-gateway"
				ports: [{
					containerPort: 8080
				}]
			}]
		}
	}
}
