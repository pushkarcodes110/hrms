# Coolify deployment

Use these values when creating the Coolify application:

```text
Build Pack: Docker Compose
Base Directory: /docker
Docker Compose Location: /docker-compose.coolify.yml
```

Coolify expects the compose location field to start with `/`. With the base directory set to `/docker`, the compose file location above resolves to:

```text
/docker/docker-compose.coolify.yml
```

Copy the values from `.env.coolify.example` into Coolify's environment variable UI and replace all placeholder passwords before deploying.
