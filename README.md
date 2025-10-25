# 🌍 Day 5: Data Sources and Dependencies — Terraform Beginner Series

## 🎯 Goal
Learn how to connect Terraform resources with **external data** using data sources and manage **dependencies** between resources.

---

## 📘 Overview
In this lesson, you’ll learn:
- How to **use data sources** to fetch information about existing resources (e.g., an existing AWS VPC).  
- The difference between **implicit** and **explicit dependencies**.  
- How to use the **`depends_on`** argument when Terraform cannot automatically infer dependencies.

---

## 🧩 1. Using Data Sources

**Data sources** let Terraform **read** information about existing infrastructure and use it in your configuration.

Example: fetching an existing VPC ID from AWS.

```hcl
data "aws_vpc" "existing_vpc" {
  filter {
    name   = "tag:Name"
    values = ["my-existing-vpc"]
  }
}

resource "aws_subnet" "example" {
  vpc_id     = data.aws_vpc.existing_vpc.id
  cidr_block = "10.0.1.0/24"
}
