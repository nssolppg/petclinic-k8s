package petclinic

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

app: [string]: [string]: #App

#App: {
	service: #Service
	deployment: #Deployment
}

#ServiceConfig: {
	id: string
	env: string
	port: int
	targetPort: int
}

#Service: v1.#Service & {
	_config: #ServiceConfig
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      _config.env + "-" + _config.id
		namespace: _config.env
	}
	spec: {
		ports: [{
			port:       _config.port
			targetPort: _config.targetPort
		}]
		selector: app: _config.id
	}
}

#DeploymentConfig: {
	id: string
	env: string
	imageName: string
	containerPort: int
}

#Deployment: apps_v1.#Deployment & {
	_config: #DeploymentConfig
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      _config.env + "-" + _config.id
		namespace: _config.env
	}
	spec: {
		replicas:             1
		revisionHistoryLimit: 3
		selector: matchLabels: app: _config.id
		template: {
			metadata: labels: app: _config.id
			spec: containers: [{
				image: _config.imageName
				name:  _config.id
				ports: [{
					containerPort: _config.containerPort
				}]
			}]
		}
	}
}
