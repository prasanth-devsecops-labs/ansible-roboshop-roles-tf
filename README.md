### 🚀 RoboShop Automation: Setup & Operations

This project automates the end-to-end infrastructure provisioning and configuration management for the RoboShop E-commerce stack.

### 1. Prerequisites (Manual Setup)

Before running the automation, you must manually set up a Management Node (Ansible Control Plane).

Launch an EC2 Instance.

Install Ansible:

sudo dnf install ansible -y

### Configure AWS CLI:

Ensure the instance has the necessary IAM permissions or configure your credentials manually:

#### aws configure

Provide Access Key, Secret Key, and Default Region (e.g., us-east-1)

Use code with caution.

### 2. Orchestration with Makefile

I have implemented a Makefile to simplify complex commands into single-word operations. This handles the lifecycle of the project infrastructure and configuration.

### 🏗️ Infrastructure Lifecycle

Command: make infra

Action: Provisions all EC2 instances and creates Route53 DNS records.

Command: make destroy

Action: Terminates all project instances and deletes associated DNS records.

### ⚙️ Configuration Management

Command: make all

Action: Configures the entire RoboShop stack (DBs first, then Apps).

Command: make <component>

Action: Configures a specific service (e.g., make shipping or make mysql).

### 3. Operational Notes

Management Node Persistence: The make destroy command targets only the RoboShop project resources. Your Management Node remains active to save you from reinstalling Ansible and reconfiguring AWS credentials for every run.

### Cost Optimization:

If you are done for the day but want to keep your setup, Stop the Management Node.

If you want to save maximum costs, Terminate the Management Node (requires re-running Step 1 next time).
