## Persistent Volum Claim for Orakl ##

This chart will deploy two separate PVCs for the external storage of Orakl.
 
- *Orakl Database:* This volume will have an SQLite database for Orakl Settings. 
- *Orakl Log:* This volume will have logs of Orakl according to Pod's Hostname.

*You can increase or decrease a volume size by changing the 'Values.yaml' file.

```
persistentVolume:
  database:
    name: orakl-database
    accessModes:
      - ReadWriteOnce
    labels: {}
    annotations: {}
    existingClaim: ""
    mountPath: /
    size: 1Gi  
    subPath: ""
    storageClass: 
  log:
    name: orakl-log
    accessModes:
      - ReadWriteOnce
    labels: {}
    annotations: {}
    existingClaim: ""
    mountPath: /
    size: 2Gi
    subPath: ""
    storageClass: 

```