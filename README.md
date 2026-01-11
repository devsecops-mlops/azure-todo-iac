# Azure Todo Application – Terraform IaC Project

This project demonstrates a **production-style Todo application infrastructure**
provisioned on **Microsoft Azure using Terraform**.

## 🧩 Application Stack

- Frontend: React.js
- Backend: Python (REST API)
- Database: MySQL
- Infrastructure: Azure + Terraform

## 🏗️ Architecture Overview

- Azure Application Gateway for traffic routing
- React frontend hosted on VM Scale Set
- Python backend hosted on VM Scale Set
- MySQL database for persistent storage
- Centralized logging using Log Analytics
- Secure access using Azure Bastion

## 📂 Terraform Modules

- Resource Group
- Virtual Network & Subnets
- Frontend VMSS (React)
- Backend VMSS (Python API)
- MySQL Database
- Application Gateway
- Azure Bastion
- Log Analytics Workspace
- Storage Account

## 🚀 Deployment Steps

```bash
az login
terraform init
terraform plan
terraform apply
