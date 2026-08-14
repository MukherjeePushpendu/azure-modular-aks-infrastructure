# 🚀 Enterprise AKS Provisioning with Custom Terraform Modules

[![Terraform](https://img.shields.io/badge/Terraform-%3E%3D1.5.0-623CE4?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Azure](https://img.shields.io/badge/Microsoft_Azure-Cloud-0089D6?logo=microsoft-azure&logoColor=white)](https://azure.microsoft.com/)
[![Kubernetes](https://img.shields.io/badge/Kubernetes-AKS-326CE5?logo=kubernetes&logoColor=white)](https://kubernetes.io/)

This repository contains an end-to-end Infrastructure as Code (IaC) implementation to deploy an enterprise-grade **Azure Kubernetes Service (AKS)** cluster using **custom, reusable Terraform modules**. 

It incorporates cloud security best practices by decoupling infrastructure into modular components, provisioning identity via **Microsoft Entra ID (Service Principal)**, and automatically securing sensitive credentials in **Azure Key Vault**.

---

## 🏛️ Architecture & Resource Flow

```text
                               +-----------------------------------+
                               |            Root Module            |
                               |    (main.tf, outputs.tf, etc.)    |
                               +-----------------------------------+
                                                 |
         +---------------------------------------+---------------------------------------+
         |                                       |                                       |
         v                                       v                                       v
+------------------+                    +------------------+                    +------------------+
|  Module 1: SPN   |                    | Module 2: KeyVlt |                    |  Module 3: AKS   |
|  (modules/spn)   |                    | (modules/keyvlt) |                    |  (modules/aks)   |
+------------------+                    +------------------+                    +------------------+
| - App Reg        |                    | - Azure Key Vault|                    | - AKS Cluster    |
| - SPN Entity     |--- client_secret ->| - Store Secrets  |                    | - System Pool    |
| - Secret Gen     |--- client_id ----->|                  |--- SPN Auth ------>| - Kubenet CNI    |
+------------------+                    +------------------+                    +------------------+
