package petclinic

import (
	"encoding/yaml"
	"tool/exec"
	"tool/cli"
)

command: create: {
	task: kube: exec.Run & {
		cmd:    "kubectl apply --dry-run=client -f -"
		stdin:  yaml.MarshalStream(objects)
		stdout: string
	}

	task: display: cli.Print & {
		text: task.kube.stdout
	}
}
