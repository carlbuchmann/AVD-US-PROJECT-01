### Generic Variables
SHELL := /bin/zsh

### Ansible variables
# Inventory for EOS playbooks
INVENTORY ?= inventories/avd-lab-ebgp
# Inventory for Linux tool box
LAB_SERVICES ?= inventories/avd-lab-services
# Default Inventory file to look for
INVENTORY_FILE = inventory.yml
# For optional ansible options
ANSIBLE_ARGS ?=
FACTS_LOG ?= ../cvp-debug-logs/arista.cvp.facts.json

### Docker variables
CURRENT_DIR = $(shell pwd)
DOCKER_NAME ?= avdteam/base
DOCKER_TAG ?= 3.6
AVD_REPOSITORY ?= ../ansible-avd/development/
ANSIBLE_VERSION ?=

.PHONY: help
help: ## Display help message (*: main entry points / []: part of an entry point)
	@grep -E '^[0-9a-zA-Z_-]+\.*[0-9a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.PHONY: facts
facts: ## Get facts from CVP and save locally
	ansible-playbook playbooks/extract-facts.yml --extra-vars "output_file=${FACTS_LOG}" -i $(INVENTORY)/$(INVENTORY_FILE)


################################################################################
# container-lab
################################################################################

.PHONY: container-lab-build
container-lab-build: ## Run ansible playbook to build EVPN Fabric configuration with DC1 and CV
	ansible-playbook playbooks/dc1-fabric-deploy-eapi.yml --tags build,debug -i inventories/container-lab/inventory.yml --diff

.PHONY: container-lab-eapi-provision
container-lab-eapi-provision: ## Run ansible playbook to build EVPN Fabric configuration with DC1 and CV
	ansible-playbook playbooks/dc1-fabric-deploy-eapi.yml --tags provision -i inventories/container-lab/inventory.yml --diff

.PHONY: container-lab-validate
container-lab-validate: ## Run ansible playbook to validate EVPN Fabric configuration with DC1 and eAPI
	ansible-playbook playbooks/dc1-fabric-validate-state.yml -i inventories/container-lab/inventory.yml --diff


################################################################################
# Docker Runner
################################################################################

.PHONY: docker-run
docker-run: ## Connect to docker container
	docker run -it --rm -e AVD_ANSIBLE=$(ANSIBLE_VERSION) -v $(CURRENT_DIR)/../:/projects $(DOCKER_NAME):$(DOCKER_TAG)
