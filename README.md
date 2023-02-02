# orakl-helm-charts
helm charts of Orakl 

---
## *step 01*
---

>Install Argocd (CICD)

<br/>

#### + Create namespace
  
```bash
kubectl create namespace argocd
```

#### + Install argocd with namespace
  
```bash
helm install argocd -n argocd charts/argocd/.
```

#### + Port forwarding
```bash
kubectl port-forward service/argocd-server -n argocd 8080:443
```

#### + Get admin temporary password
```bash
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d
```
##### * Remove '%' in the end of the password if it exists.

<br/>

#### + Access Argocd UI admin(http://localhost:8080) and changed admin password.  (_User Info -> Update Password_)

<br/><br/>

---
## *step 02*
---

>Install Prometheus (Monitoring)

<br/>

#### + Create prometheus name space

```bash
kubectl create namespace prometheus
```


#### + Install Prometheus with Argocd
1) Create Application
2) Fill Source

+ Repository URL: https://prometheus-community.github.io/helm-charts
+ Select Helm
+ Chart: prometheus
+ Select Version
3) Fill Destination
+ Cluster URL: https://kubernetes.default.svc
+ Namespace: prometheus
  
<br/>
