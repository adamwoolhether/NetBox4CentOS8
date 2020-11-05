# NetBox4CentOS8

This playbook will bootstrap your Netbox install on a clean CentOS 8 system. 

Replace values in `vars/config.yml`, and set target ip in `inventory`.

Assuming target host will serve as the Netbox controller, Ansible & Netbox Modules are installed in Play 7.

Why make this? Official install documentation lacks proper procedure for CentOS 8. Having a playbook makes the entire setup process extremely quick and easy.


## How to

#### 1. Fill in the `vars/configTMPLATE.yml` & change file name to `config.yml` 

`auth` specifies the PostgreSQL username and password.

`config` specifies your Netbox site's ip address and domain.

`app` specifies the actual Netbox app/site's admin user credentials.

`ssl` specifies the self-signed cert information. These are option and can be left blank.

#### 2. Setup Target

Within inventory, place your target host(s) under a group called `netboxhost`.

Or, to install locally, change to `hosts: localhost` and add `connection: local` within each play.

#### 3. Run the  `installNB.yml`playbook

Done.

## NOTES:

Running `config.sh` takes some time. Don't stop the playbook during this task.

The playbook WILL hang if you're trying to create a user for the NetBox app that already exists.

I assume a non DNS registered domain is used. Modify the `httpdconf.j2` file if needed.

Some conditionals are added for increased idempotency where shell/command module must be used.

Again, this is meant to run once to bootstrap/automate the install process.
  
## Further Reading:

Offical Netbox Docs: https://netbox.readthedocs.io

Netbox Community Github: https://github.com/netbox-community

Netbox Ansible Modules Docs: https://netbox-ansible-collection.readthedocs.io/en/latest/

## Coming Soon
Soon I'll share my playbooks and demonstrate how we automatically populate server-data and rack location.
