package petclinic

objects: [ for v in objectSets for w in v for x in w for y in x { y } ]

objectSets: [
	app,
]
