# Orakl Klaytn

This doc is for deploying Orakl of Klaytn using applications such as  Argocd, Prometheus, etc.
Each directory contains a 'README.md' file, and the README has instructions on installing it in AWS Kubernetes.  

---

## Index ##
<br/>

Optional
> + [Argocd](https://github.com/Bisonai-CIC/orakl-helm-charts/tree/main/argocd) (Optional, CICD Tools with Kubernetes)
> + [Prometheus](https://github.com/Bisonai-CIC/orakl-helm-charts/tree/main/prometheus) (Optional, Monitoring Tool)

Required
> 1) [Redis](https://github.com/Bisonai-CIC/orakl-helm-charts/tree/main/redis)
> 2) [Cli](https://github.com/Bisonai-CIC/orakl-helm-charts/tree/main/cli) (Initial configuration)
> 3) [VRF](https://github.com/Bisonai-CIC/orakl-helm-charts/tree/main/vrf) (Required)
> 4) [Request-Response](https://github.com/Bisonai-CIC/orakl-helm-charts/tree/main/request-response) (Required)

*Required applications need to be installed by sequence*

## How to release new version charts
1. (If exist updated tag image) copy the tag, and paste to `values.yaml` of updated service.
2. Increase version value in the `Chart.yaml`. and edit `appVersion` in the same file.
   1. If you tag image is `v0.3.1.20230712.0827.c373159`
   app version is `0.3.1`
3. Generate package file by using following command in the root directory.
```bash
helm package ${service name} --destination ./charts
# Example: Generate VRF package
helm package vrf --destination ./charts
# Example: Generate all packages
find * -name 'Chart.yaml' -exec dirname {} \; | xargs helm package --destination ./charts
```
4. Use the following command to automatically update to the helm charts index file.
```bash
helm repo index .
```
5. Update helm repository by using following command.
```bash
helm repo up
```
