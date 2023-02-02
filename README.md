# orakl-helm-charts
helm charts of Orakl 

---
## Git + Argocd
---

>Install Argocd (CICD)

<br/>

#### + Create namespace
  
```bash
kubectl create namespace argocd
```

#### + Install argocd with namespace
  
```bash
helm install argocd -n argocd argocd/.
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

<br/>