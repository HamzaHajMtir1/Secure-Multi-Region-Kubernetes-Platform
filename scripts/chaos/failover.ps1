Write-Host "===== FAILOVER START ====="

Write-Host "Connecting to Secondary AKS..."

az aks get-credentials `
    --name aks-secondary `
    --resource-group rg-platform-secondary `
    --overwrite-existing

Write-Host "Scaling application to 2 replicas..."

kubectl scale deployment app --replicas=2

Write-Host "===== FAILOVER FINISHED ====="