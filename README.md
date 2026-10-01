# Project Overview

## 1. Terraform – Azure Infrastructure

Terraform is used as Infrastructure as Code (IaC) to define the Azure infrastructure in a modular and reusable way.

The planned infrastructure includes:

- Azure Resource Group
- Virtual Network and Subnets
- Azure Kubernetes Service (AKS)
- Azure Container Registry (ACR)
- Azure Key Vault
- Azure DevOps Self-hosted Agent VM

Terraform modules are organized for:

`resource-group`, `network`, `aks`, `acr`, `keyvault`, and `agent-vm`.

---

## 2. CI/CD + AKS

The project includes an Azure DevOps CI/CD pipeline design.

### CI Pipeline

`Code → Install → Test → SonarQube → Mend → Docker Build → Trivy Scan → ACR Push`

Frontend and backend applications are built as separate Docker images and are designed to be pushed to Azure Container Registry.

### CD Pipeline

`CI → DEV → Smoke Test → TEST → PROD`

The deployment is designed for Azure Kubernetes Service (AKS) using Helm 3.

The Kubernetes setup includes:

- Frontend Deployment and Service
- Backend/API Deployment and Service
- Ingress
- ConfigMap and Secret
- Horizontal Pod Autoscaler (HPA)
- Health probes
- Separate DEV, TEST and PROD namespaces

---

## 3. Frontend + Backend – Vite + Microservices

The application is structured as two separate services: frontend and backend.

**Frontend:** React + Vite  
**Backend:** Node.js REST API

Both services are containerized using Docker and are designed to run as separate Kubernetes Deployments and Services.

The frontend communicates with the backend through a Kubernetes Service rather than directly using Pod IP addresses.

**Application flow:**

`User → Ingress → Frontend → Backend Service → Backend Pod`

---

## 4. Helm 3 – Chart Introduction

Helm 3 is used as the Kubernetes package manager for reusable and environment-specific deployments.

The Helm chart contains:

- `Chart.yaml` – Chart metadata
- `values.yaml` – Default configuration
- `values-dev.yaml` – DEV configuration
- `values-test.yaml` – TEST configuration
- `values-prod.yaml` – PROD configuration
- `templates/` – Kubernetes manifest templates

The templates cover resources such as:

`Deployment, Service, Ingress, ConfigMap, Secret, HPA, ServiceAccount`

Common Helm commands used in the project:

```text
helm lint
helm template
helm install
helm upgrade
helm upgrade --install
helm status
helm history
helm rollback
```

The same Helm chart can be reused across DEV, TEST and PROD by providing environment-specific values.

---

## Current Status

The application, Docker, Kubernetes, Helm 3, Terraform and Azure DevOps CI/CD configurations are prepared as a hands-on project.

Azure infrastructure provisioning and end-to-end AKS deployment testing are **pending**. The README will be updated after the Azure infrastructure is successfully provisioned and the CI/CD deployment is tested end-to-end.