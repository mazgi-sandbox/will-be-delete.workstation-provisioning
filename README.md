# workstation-provisioning

Available languages: [日本語](README.ja.md)

## How to try it with Vagrant

```shellsession
vagrant up
```

or

```shellsession
vagrant provision
```

## How to provision via Docker Compose

```shellsession
docker-compose run provisioning ansible-playbook -i 192.0.2.1, -u $(id -un) site.yml
```

## How to provision on bare-metal hosts

provision localhost:

```shellsession
pip install --user ansible==2.9.2
ansible-playbook -i localhost, -c local -u $(id -un) site.yml
```

provision remote hosts:

```shellsession
pip install --user ansible==2.9.2
echo TARGET-IPADDRS-OR-FQDNS > inventories/hosts
docker-compose run provisioning ansible-playbook -i inventories/hosts -u $(id -un) site.yml
```
