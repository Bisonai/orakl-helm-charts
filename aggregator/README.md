## Request-Response Settings for Orakl ##
---


This chart will deploy the Request-Response of Orakl.


``` bash
global:
  image:
    repository: docker.io/jolol/orakl #repository url
    pullPolicy: IfNotPresent
    tag: "v.0.0.6"                    #image tag
    imagePullPolicy: IfNotPresent
    # -- If defined, uses a Secret to pull an image from a private Docker registry or repository
    imagePullSecrets: []

  config:
    NODE_ENV: production    #[dev, production]
    CHAIN: baobab           #[baobab, cypress]
    HOST_SETTINGS_DB_DIR:   #Default is empty
    HEALTH_CHECK_PORT: 8888 #Specify Helath Check Port
    ORAKL_DIR: /app/db      #The path should match with PVC of Orakl database
    REDIS_HOST: localhost   #Redis Host Url
    REDIS_PORT: 6379        #Redis Port
    SLACK_WEBHOOK_URL:      #Error message is delivered to slack 
    LOG_LEVEL: debug        #[info, debug]
    LOG_DIR: /app/log       #The path should match with PVC of Orakl Log
    ```   