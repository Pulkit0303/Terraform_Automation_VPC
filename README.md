# AWS VPC Infrastructure Automation with Terraform

![Terraform](https://img.shields.io/badge/Terraform-844FBA?logo=terraform&logoColor=white&style=for-the-badge)
![AWS](https://img.shields.io/badge/AWS-232F3E?logo=amazon-aws&logoColor=white&style=for-the-badge)
![EC2](https://img.shields.io/badge/EC2-FF9900?logo=amazon-aws&logoColor=white&style=for-the-badge)
![VPC](https://img.shields.io/badge/VPC-Networking%20on%20AWS-orange?logo=amazon-aws&logoColor=white&style=for-the-badge)

<p align="center">
  <img src="my-vpc-diagram.png" alt="Custom VPC Architecture" width="800"/>
</p>

> **Status**: ✅ Completed  
> **Author**: [Pulkit Heda](https://github.com/Pulkit1903)  
> **Project Type**: Learning / Infrastructure Setup  

---

## 📌 Overview

I automated the creation of a secure and scalable **AWS Virtual Private Cloud (VPC)** using **Terraform**.  
This project reduces **manual efforts**, **unwanted AWS cost**, and ensures **repeatable infrastructure** using Infrastructure as Code (IaC).

---

## 🔨 What I Built

- ✅ Custom **AWS VPC**
- ✅ **Public** and **Private** Subnets for isolation
- ✅ Two separate **Route Tables** for controlled routing
- ✅ **Internet Gateway (IGW)** for public subnet 🌐
- ✅ **NAT Gateway** for secure outbound traffic from private subnet 🔁
- ✅ EC2 Instances in each subnet
- ✅ SSH access from public EC2 to private EC2 via **Bastion Host** 🔐
- ✅ **VPC Peering** between default and custom VPCs 🔄

---

## 🧰 Tools & Technologies

| Tool            | Purpose                              |
|-----------------|---------------------------------------|
| 🧾 **Terraform** | Infrastructure automation             |
| ☁️ **AWS**       | Cloud provider                        |
| 🖥️ **EC2**        | Compute resource for Bastion and app |
| 🌐 **IGW**        | Public internet access               |
| 🔁 **NAT GW**     | Private subnet internet egress       |
| 🔐 **SSH**        | Secure remote login                  |
| 🔄 **VPC Peering**| Cross-VPC communication              |

---

## 🧠 What I Learned

- 🏗️ Building secure VPC architectures  
- 🛡️ Subnet isolation and network security  
- 🚪 Bastion host architecture  
- 🔁 VPC Peering and cross-VPC traffic routing  
- 📦 Writing modular, reusable Terraform code  
- 🔄 Idempotent deployments using IaC principles  

---
