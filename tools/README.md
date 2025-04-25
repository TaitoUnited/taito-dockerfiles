# Tools

Reusable simple tools and scripts for running data exports as cron job, etc.

Example helm.yaml usage:

```
    exports:
      serviceEnabled: false # Used only for cronjobs
      image: ghcr.io/taitounited/tools:1.2.0
      egress:
        - ip: "${db_database_real_host}/32"
        - domain: myanalytics.blob.core.windows.net
      db:
        useProxy: ${gcp_db_proxy_enabled}
        instance: ${taito_zone}:${taito_provider_region}:${db_database_instance}
        port: ${db_database_real_port}
        proxySecret: ${taito_provider_db_proxy_secret}
      secrets:
        DATABASE_PASSWORD: ${db_database_app_secret}
        STORAGE_TOKEN: ${taito_project}-${taito_env}-myanalytics-storage.sastoken
      env:
        DATABASE_HOST: "${db_database_real_host}"
        DATABASE_PORT: "${db_database_real_port}"
        DATABASE_NAME: ${db_database_name}
        DATABASE_USER: ${db_database_app_username}
        STORAGE_TYPE: AZURE_BLOB
        STORAGE_URL: https://myanalytics.blob.core.windows.net/mycontainer
        STORAGE_PATH: myproject
      cronJobs:
        # Exports database data to Azure blob storage
        - name: azure
          schedule: "0 21 * * *"
          concurrencyPolicy: Replace
          # Run db export for specific tables and finally quit the db proxy
          command:
            - sh
            - -c
            - >
              db_export my_table1,my_table2;
              exit_code=$?; curl -X POST localhost:9091/quitquitquit; exit $$exit_code
```
