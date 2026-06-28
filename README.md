

# Automated Kubernetes Cluster Provisioning on AWS using Terraform, Ansible & Make AI

## Overview

This project demonstrates an end-to-end DevOps workflow that provisions AWS infrastructure, automates Kubernetes cluster installation, deploys applications, and integrates AI-powered automation using Make.

The infrastructure is provisioned using **Terraform**, Kubernetes is installed and configured using **Ansible**, and applications are deployed onto the cluster using Kubernetes manifests.

----------

## Architecture

```text
                 Developer
                     │
                     ▼
             GitHub Repository
                     │
                     ▼
            Make AI Workflow
                     │
       AI analyzes infrastructure changes
                     │
                     ▼
          Terraform Provisioning
                     │
        Creates AWS EC2 Infrastructure
                     │
                     ▼
      Generates Dynamic Ansible Inventory
                     │
                     ▼
         Ansible Configuration
                     │
     ┌───────────────┴───────────────┐
     ▼                               ▼
 Kubernetes Control Plane      Worker Nodes
     │                               │
     └───────────────┬───────────────┘
                     ▼
              Kubernetes Cluster
                     │
                     ▼
          Deploy Containerized App
                     │
                     ▼
            NodePort Service
                     │
                     ▼
                Browser Access

```

----------

# Technologies Used

Category

Technologies

Cloud

AWS EC2

IaC

Terraform

Configuration Management

Ansible

Container Runtime

containerd

Container Orchestration

Kubernetes

Networking

Calico CNI

Automation

Make AI

OS

Ubuntu Linux

Version Control

Git & GitHub

----------

# Features

-   Infrastructure provisioning using Terraform
    
-   Dynamic Ansible inventory generation
    
-   Automated Kubernetes cluster installation
    
-   Automated control plane initialization
    
-   Automated worker node joining
    
-   Calico networking installation
    
-   NodePort application exposure
    
-   AI-powered deployment workflow using Make
    
-   Containerized application deployment
    

----------

# Project Structure

```text
.
├── terraform/
│   ├── main.tf
│   └── source.tf
│
├── ansible/
│   ├── playbook-master.yml
│   ├── playbook-worker.yml
│
├── screenshots/
│
├── diagrams/
│
└── README.md

```

----------

# Workflow

### 1. Provision Infrastructure

```bash
terraform init
terraform apply

```

Terraform provisions:

-   Kubernetes Control Plane
    
-   Worker Nodes
    
-   Security Groups
    
-   SSH Key Pair
    

----------

### 2. Configure Kubernetes

```bash
ansible-playbook playbook-master.yml

ansible-playbook playbook-worker.yml
```
Ansible automatically:

-   Disables swap
    
-   Configures kernel modules
    
-   Installs containerd
    
-   Installs Kubernetes packages
    
-   Initializes control plane
    
-   Installs Calico
    
-   Generates join command
    
-   Joins worker nodes
    

----------

### 3. Deploy Application

```bash
kubectl apply -f deployment.yaml

kubectl apply -f service.yaml

```

----------

### 4. Verify Cluster

```bash
kubectl get nodes

```

Example:

```text
NAME                 STATUS
master               Ready
worker-node-1        Ready
worker-node-2        Ready

```

----------

### 5. Verify Pods

```bash
kubectl get pods -A

```

----------

### 6. Access Application

```text
http://<Worker-Public-IP>:30080

```

----------

# AI Automation Workflow

```text
Start workflow
      │
      ▼
GitHub Repository
      │
      ▼
Make AI Workflow
      │
AI analyzes repository changes
      │
      ▼
Terraform Infrastructure Provisioning
      │
      ▼
Dynamic Inventory Generation
      │
      ▼
Ansible Kubernetes Configuration
      │
      ▼
Application Deployment
      │
      ▼
Deployment Summary

```

----------

# Key Learnings

-   Infrastructure as Code using Terraform
    
-   Kubernetes Cluster Bootstrapping
    
-   Configuration Management with Ansible
    
-   Dynamic Inventory Automation
    
-   AWS Networking and Security Groups
    
-   Kubernetes Networking with Calico
    
-   Kubernetes Service Exposure using NodePort
    
-   Linux System Administration
    
-   AI-assisted Infrastructure Automation
    

----------
