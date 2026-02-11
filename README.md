# Cloud CI/CD Platform on AWS

## Overview

This project demonstrates an end-to-end CI/CD pipeline built using Terraform, Jenkins, and Docker on AWS EC2.

The goal of this project was not just to “run Jenkins”, but to understand how infrastructure, containerization, and pipeline automation work together in a real cloud environment.

The system provisions infrastructure using Terraform, runs Jenkins securely as a non-root user, builds Docker images automatically, and deploys containers through a structured pipeline.

---

## Architecture

Developer
│
▼
Jenkins Pipeline
│
▼
Docker Image Build
│
▼
EC2 Runtime Container


Infrastructure is provisioned using Terraform.

The pipeline automates:
- Docker availability verification
- Image build process
- Safe container replacement
- Deployment validation through logs

---

## Tech Stack

- AWS EC2 (t2.micro – Free Tier)
- Terraform (Infrastructure as Code)
- Jenkins (Declarative Pipeline)
- Docker
- Ubuntu Linux

---

## Project Structure

cloud-ci-cd-platform/
├── terraform/ # Infrastructure provisioning
├── app/ # Application source & Dockerfile
├── Jenkinsfile # CI/CD pipeline definition
├── docs/ # Documentation assets
└── README.md


---

## CI/CD Workflow

1. Terraform provisions EC2 infrastructure.
2. Jenkins runs on EC2 as a non-root user.
3. Pipeline verifies Docker availability.
4. Docker image is built from the application source.
5. Any existing container is safely removed.
6. A new container is deployed.
7. Pipeline logs confirm successful execution.

---

## Sample Pipeline Output

=================================
CI/CD Pipeline Running on AWS EC2
Built by Jenkins + Docker
Timestamp: Wed Feb 11 12:07:13 UTC 2026

---

## Engineering Decisions

- Jenkins configured to run as a non-root user for security.
- Docker permissions handled via proper group management.
- Defensive container cleanup using `docker rm -f || true`.
- Infrastructure managed through Terraform for reproducibility.
- EC2 instance stopped when not in use to minimize cloud cost.

---

## Challenges Faced

- Debugging Docker permission issues between Jenkins and the Docker daemon.
- Handling Linux user ownership and access control.
- Resolving Docker build errors caused by shell formatting mistakes.
- Managing resource constraints on a t2.micro instance.

Each issue was resolved through log inspection and step-by-step debugging rather than trial-and-error.

---

## What This Project Demonstrates

- Understanding of CI/CD pipeline design
- Infrastructure as Code implementation
- Container lifecycle management
- Linux system-level troubleshooting
- Secure service configuration practices
- Cost-aware cloud deployment

---

## Reproducibility

To reproduce this setup:

1. Provision EC2 using Terraform.
2. Install Docker and Jenkins.
3. Configure Jenkins pipeline using the provided Jenkinsfile.
4. Trigger the pipeline build.

---

## Future Improvements

- Add GitHub webhook-based auto-triggering.
- Push Docker images to a remote registry.
- Implement monitoring with Prometheus or CloudWatch.
- Convert Jenkins into a systemd-managed service.

