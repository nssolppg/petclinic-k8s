package petclinic

objects: [ for v in objectSets for w in v for x in w { x } ]

objectSets: [
	service,
	deployment,
]
