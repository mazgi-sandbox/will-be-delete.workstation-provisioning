# workstation-provisioning

## How to try it with Vagrant

```shellsession
vagrant up
```

or

```shellsession
vagrant provision
```

## How to provision to real hosts

```shellsession
echo YOUR-WS-IPADDR-OR-FQDN > inventories/hosts
docker-compose run provisioning ansible-playbook -i inventories/hosts -u $(id -un) site.yml
```
