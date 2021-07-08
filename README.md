# AVD-US-PROJECT-1

## Development environment setup and requirement

**WIP**

**special notes:**

- currently based on aristanetworks/ansible-avd [PR #1000](https://github.com/aristanetworks/ansible-avd/pull/1000)
  - documentation for PR located [here](https://ansible-avd-fork.readthedocs.io/en/disagg-topology-support/roles/eos_designs/doc/l3ls-evpn/fabric-topology.html)

**Requirements:**

  - [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - [github cli](https://github.com/cli/cli#installation)
  - [docker](https://docs.docker.com/get-docker/)

**Installation using git methodology:**

```shell
  # Clone repositories
  git clone https://github.com/carlbuchmann/AVD-US-PROJECT-01.git
  cd AVD-US-PROJECT-01/
  # Install Ansible AVD branch
  ansible-galaxy collection install -r ansible-galaxy.yml
  # Copy Makefile to folder, this will be used to start AVD Team container
  cp ansible-avd/development/Makefile Makefile
  # Start AVD Team container
  cd ..
  make run
  # Run container-lab-build test Ansible playbook
  cd AVD-US-PROJECT-1
  make container-lab-build
```

