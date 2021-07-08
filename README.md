# AVD-US-PROJECT-1

## Development environment setup and requirement

**WIP**

**special notes:**

- currently based on aristanetwork/ansible-avd [PR #1000](https://github.com/aristanetworks/ansible-avd/pull/1000)
  - documentation for PR located [here](https://ansible-avd-fork.readthedocs.io/en/disagg-topology-support/roles/eos_designs/doc/l3ls-evpn/fabric-topology.html)

**Requirements:**

  - [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - [github cli](https://github.com/cli/cli#installation)
  - [docker](https://docs.docker.com/get-docker/)

**Installation using git methodology:**

```shell
  #Clone repositories
  git clone https://github.com/carlbuchmann/AVD-US-PROJECT-01.git
  git clone https://github.com/aristanetworks/ansible-avd.git
  cp ansible-avd/development/Makefile Makefile
  cd ansible-avd
  gh pr checkout 1000
  cd ..
  # start container
  make run
  cd AVD-US-PROJECT-1
  # run build playbook
  make container-lab-build
```

