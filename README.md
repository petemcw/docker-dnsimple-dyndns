# petemcw/docker-dnsimple-dyndns

For users of [DNSimple](https://dnsimple.com) domain management, this is a script that will dynamically update a DNS record with your current public IP address.

![](https://raw.githubusercontent.com/petemcw/docker-templates/master/petemcw/img/dnsimple-banner.png)

## Usage

```
docker create --name=dyndns -v <path to data>:/config \
    -e PGID=<gid> \
    -e PUID=<uid> \
    -e LOGIN=<email> \
    -e TOKEN=<token> \
    -e DOMAIN_ID=<domain> \
    -e RECORD_ID=<record> \
    petemcw/dnsimple-dyndns
```

**Parameters**

* `-v /config`
* `-e PGID` for GroupID
* `-e PUID` for UserID
* `-e LOGIN` for DNSimple - generally your email address
* `-e TOKEN` for DNSimple API
* `-e DOMAIN_ID` for DNSimple domain
* `-e RECORD_ID` for DNSimple record to update

It is based on phusion-baseimage with ssh removed, for shell access whilst the container is running do `docker exec -it dyndns /bin/bash`.

## Setting up the application 

* Use the default or edit the `ddns.sh` in the `/config` folder.
* Update the `/config/cron/crontab` as necessary.

## Updates

* Upgrade to the latest version simply `docker restart dyndns`.
* To monitor the logs of the container in real-time `docker logs -f dyndns`.

## Credits

This Docker container is based on the great work from the team at [LinuxServer.io](https://www.linuxserver.io/).
