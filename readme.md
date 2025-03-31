# ☁️ Backup Automation for Cloud Storage Buckets

![Backup Automation](https://user-images.githubusercontent.com/backup-automation.png)

[![Terraform](https://img.shields.io/badge/IaC-Terraform-blue?style=flat&logo=terraform)](https://www.terraform.io/)
[![AWS S3](https://img.shields.io/badge/Storage-AWS%20S3-orange?style=flat&logo=amazonaws)](https://aws.amazon.com/s3/)
[![GCP Storage](https://img.shields.io/badge/Storage-GCP%20Cloud%20Storage-red?style=flat&logo=googlecloud)](https://cloud.google.com/storage/)
[![GitHub Actions](https://img.shields.io/badge/CI/CD-GitHub%20Actions-blue?style=flat&logo=githubactions)](https://github.com/features/actions)

This project automates backups from a local directory to **AWS S3** and **GCP Cloud Storage** using **Terraform**, **Bash**, and **GitHub Actions**.

---

## 📚 Table of Contents
- [Features](#-features)
- [Prerequisites](#-prerequisites)
- [Setup AWS & GCP Credentials](#-setup-aws--gcp-credentials)
- [Store Secrets in GitHub](#-store-secrets-in-github)
- [Deploy with Terraform](#-deploy-with-terraform)
- [Automate Backups](#-automate-backups-with-github-actions)
- [Project Structure](#-project-structure)
- [License](#-license)
- [Contact](#-contact)

---

## 🎯 Features
✅ **Backup files from local storage to AWS S3 & GCP**  
✅ **Automated daily backups via GitHub Actions**  
✅ **Compression, versioning, and verification included**  
✅ **Slack/Webhook notifications on success or failure**  
✅ **Terraform-managed cloud infrastructure**  

---

## 🛠 Prerequisites
1. **Terraform Installed** → [Download Here](https://developer.hashicorp.com/terraform/downloads)
2. **AWS CLI Installed & Configured** → [Guide](https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html)
3. **GCP SDK Installed & Configured** → [Guide](https://cloud.google.com/sdk/docs/install)
4. **GitHub Repository with Secrets** (AWS & GCP credentials)

---

## 🔐 Setup AWS & GCP Credentials

### **AWS Credentials**
```bash
aws configure
```
Add the following secrets to GitHub:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`

### **GCP Credentials**
Create a **Service Account Key** and save it as `gcp-key.json`. Then, add its content as a GitHub Secret:
- `GCP_SERVICE_ACCOUNT_KEY`

---

## 🔑 Store Secrets in GitHub
Navigate to **GitHub → Your Repository → Settings → Secrets** and add:
- `AWS_ACCESS_KEY_ID`
- `AWS_SECRET_ACCESS_KEY`
- `AWS_REGION`
- `GCP_SERVICE_ACCOUNT_KEY`
- `SLACK_WEBHOOK_URL` (Optional)

---

## 🚀 Deploy with Terraform
```bash
terraform init
terraform apply -auto-approve
```
✔ This will create **AWS S3 & GCP Storage Buckets**.

---

## 🤖 Automate Backups with GitHub Actions
Push your changes to trigger the workflow:
```bash
git add .
git commit -m "Initial backup automation setup"
git push origin main
```
✔ GitHub Actions will now **run the backup daily at 2 AM UTC**.

---

## 📂 Project Structure
```
.
├── .github/
│   └── workflows/
│       └── github_action_backup.yml
├── terraform/
│   ├── providers.tf
│   ├── aws_s3.tf
│   ├── gcp_storage.tf
├── scripts/
│   ├── deploy.sh
│   ├── cleanup.sh
├── .env
├── README.md
```

---

## 📜 License
This project is licensed under the **MIT License**.

---

## 📞 Contact
For any issues, open an **issue** on GitHub.
