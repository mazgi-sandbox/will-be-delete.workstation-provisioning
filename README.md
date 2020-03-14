# workstation-provisioning

![GitHub Actions status for "test-all"](https://github.com/mazgi/workstation-provisioning/workflows/test-all/badge.svg)

Available languages: [日本語](README.ja.md)

## How to try it with Vagrant

```shellsession
vagrant up ubuntu18
```

or

```shellsession
vagrant provision ubuntu18
```

## How to provision via Docker Compose

```shellsession
docker-compose run provisioning ansible-playbook -i 192.0.2.1, -u $(id -un) site.yml
```

## How to provision on bare-metal hosts

provision remote hosts:

```shellsession
export GITHUB_USER=$(id -un)
docker-compose run provisioning ansible-playbook --inventory FQDN, --user $GITHUB_USER workstation-provisioning/site.yml
```

provision localhost:

```shellsession
pip install --user ansible~=2.9
export GITHUB_USER=$(id -un)
ansible-playbook --connection local --inventory localhost, --user $GITHUB_USER site.yml
```

## Links

- https://github.com/mazgi?tab=repositories&q=ansible-galaxy.
- https://github.com/geerlingguy/macos-virtualbox-vm
