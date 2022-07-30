# Homeserver
Home server configuration using `docker` and `docker-compose`.

Note: This configuration is meant to be used for a server accessible only from LAN (use a VPN for external access if your router supports it). There is no SSL configuration or additional hardening included, so do NOT use this setup as-is on an exposed network.

### Usage
1. `cp env.template .env`

2. Fill in variables in `.env`

3. `docker compose up -d`
