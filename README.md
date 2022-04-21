# Homeserver
Home server configuration using `docker` and `docker-compose`.

Note: This configuration is meant to be used for a server accessible only from LAN (use a VPN for external access if your router supports it). There is no SSL configuration or additional hardening included, so do NOT use this setup as-is on an exposed network.

### Usage
1. `cp env.template .env`

2. Fill in variables in `.env`

    - `$DOMAIN` - hostname of the server on LAN
    - `$GITEA_POSTGRES_USERNAME` - username for gitea user in `gitea-db`
    - `$GITEA_POSTGRES_PASSWORD` - password for gitea user in `gitea-db`
    - `$GITEA_SSH_PORT` - SSH port on host to forward to port 22 in `gitea` container

3. `docker compose up -d`
    

### Services
- [Gitea](https://gitea.io/en-us/) running at `$DOMAIN/gitea`

### TODO
- [ ] Add CI/CD (probably [Concourse](https://concourse-ci.org/))