package petclinic

import (
	"k8s.io/api/core/v1"
	apps_v1 "k8s.io/api/apps/v1"
)

service: [string]: [string]: #Service
#Service: v1.#Service & {
	_id: string
	_env: string
	_port: int
	_targetPort: int
	apiVersion: "v1"
	kind:       "Service"
	metadata: {
		name:      _env + "-" + _id
		namespace: _env
	}
	spec: {
		ports: [{
			port:       _port
			targetPort: _targetPort
		}]
		selector: app: _id
	}
}

deployment: [string]: [string]: #Deployment
#Deployment: apps_v1.#Deployment & {
	_id: string
	_env: string
	_imageName: string
	_containerPort: int
	apiVersion: "apps/v1"
	kind:       "Deployment"
	metadata: {
		name:      _env + "-" + _id
		namespace: _env
	}
	spec: {
		replicas:             1
		revisionHistoryLimit: 3
		selector: matchLabels: app: _id
		template: {
			metadata: labels: app: _id
			spec: containers: [{
				image: _imageName
				name:  _id
				ports: [{
					containerPort: _containerPort
				}]
			}]
		}
	}
}
