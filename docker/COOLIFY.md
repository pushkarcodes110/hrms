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

This compose file builds a custom runtime image with both ERPNext and HRMS. HRMS depends on ERPNext internally, even when the deployment is intended to be used as Frappe HR.

For the repository's `develop` branch, the defaults are:

```text
ERPNEXT_IMAGE=frappe/erpnext:develop
HRMS_REPO=https://github.com/pushkarcodes110/hrms
HRMS_BRANCH=develop
```

For a versioned production deployment, set matching versions for both apps, for example `frappe/erpnext:v15.x.x` with `HRMS_BRANCH=version-15`.

## Troubleshooting

If the database logs show this after switching MariaDB versions:

```text
Unsupported redo log format. The redo log was created with MariaDB 11.8.6.
Unknown/unsupported storage engine: InnoDB
```

the persistent `db-data` volume was already initialized by MariaDB 11.8. MariaDB data directories cannot be downgraded in place.

For a fresh deployment with no real data yet, delete the Coolify application volumes and redeploy. If you already have production data, do not delete the volume; restore from a backup into a compatible MariaDB version instead.
