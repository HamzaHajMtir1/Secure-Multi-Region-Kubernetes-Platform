# 🚀 Secure Multi-Region Kubernetes Platform on Azure

A production-ready DevOps project that deploys a secure Kubernetes platform on Microsoft Azure using Infrastructure as Code (Terraform), Docker, Kubernetes, and Azure services.

---

## 📌 Project Overview

This project demonstrates how to build and deploy a secure cloud-native application using Azure best practices.

The infrastructure is provisioned with Terraform, the application is containerized with Docker, stored in Azure Container Registry (ACR), and deployed to Azure Kubernetes Service (AKS).

---

## 🏗️ Architecture

```
                    GitHub
                       │
                       ▼
                  Docker Build
                       │
                       ▼
            Azure Container Registry
                       │
                       ▼
              Azure Kubernetes Service
                       │
        ┌──────────────┴──────────────┐
        ▼                             ▼
   Node.js Application          Azure Key Vault
        │
        ▼
 Azure PostgreSQL Flexible Server

Terraform provisions all Azure resources.
```

---

## ☁️ Azure Services Used

- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Azure PostgreSQL Flexible Server
- Azure Key Vault
- Azure Resource Groups
- Azure Storage Account (Terraform Remote State)

---

## 🛠️ Technologies

- Terraform
- Microsoft Azure
- Docker
- Kubernetes
- Node.js
- Azure CLI
- Git & GitHub

---

## 📂 Project Structure

```
secure-multiregion-platform/
│
├── app/
│   └── src/
│       └── index.js
│
├── k8s/
│   └── base/
│       └── deployment.yaml
│
├── terraform/
│   ├── modules/
│   │   └── region-stack/
│   │       ├── main.tf
│   │       ├── variables.tf
│   │       └── outputs.tf
│   │
│   └── environments/
│       ├── primary/
│       └── secondary/
│
├── Dockerfile
├── .gitignore
└── README.md
```

---

## 🚀 Deployment

### Clone repository

```bash
git clone https://github.com/HamzaHajMtir1/Secure-Multi-Region-Kubernetes-Platform.git

cd Secure-Multi-Region-Kubernetes-Platform
```

---

### Initialize Terraform

```bash
terraform init
```

### Validate

```bash
terraform validate
```

### Plan

```bash
terraform plan
```

### Apply

```bash
terraform apply
```

---

## 🐳 Build Docker Image

```bash
docker build -t acrplatformprimary.azurecr.io/app:v2 .
```

Push image

```bash
docker push acrplatformprimary.azurecr.io/app:v2
```

---

## ☸ Deploy to AKS

```bash
kubectl apply -f k8s/base/deployment.yaml
```

Verify

```bash
kubectl get pods

kubectl get svc
```

---

## 🔐 Security Features

- Infrastructure as Code using Terraform
- Non-root Docker container
- Azure Key Vault integration
- Azure Container Registry
- Kubernetes resource limits
- Health checks (Liveness Probe)
- Azure managed Kubernetes

---

## 📈 Future Improvements

- GitHub Actions CI/CD
- Helm Charts
- Prometheus & Grafana
- Azure Monitor
- NGINX Ingress Controller
- TLS with Cert-Manager
- Multi-region failover
- Horizontal Pod Autoscaler

---

## 📸 Demo

Application health endpoint

```
GET /health
```

Example response

```json
{
  "status": "ok"
}
```

---


**Note: Automated deployment to Azure is not enabled in this repository because the Azure subscription is managed by an institutional tenant that restricts Service Principal creation. Infrastructure provisioning and application deployment were successfully validated manually on Azure AKS.**


## 👨‍💻 Author

**Hamza Haj Mtir**

GitHub:

https://github.com/HamzaHajMtir1

LinkedIn:

https://www.linkedin.com/in/hamza-haj-mtir/

---

## 📄 License

This project is released under the MIT License.