# 🚀 Jenkins CI/CD Pipeline for Flask Web App

A simple CI/CD pipeline using **Jenkins**, **Docker**, and **AWS EC2** to automate the build and deployment of a Python Flask application.

---

## 🔧 Tech Stack

- **CI/CD**: Jenkins
- **App**: Python (Flask)
- **Containerization**: Docker
- **Cloud**: AWS EC2
- **Registry**: Docker Hub

---

## 📁 Project Structure


```.
├── app/ # Flask app source code
│ ├── app.py
│ ├── Dockerfile
│ └── requirements.txt
├── scripts/ # Deployment script
│ └── deploy.sh
├── Jenkinsfile # Jenkins pipeline definition
└── README.md
```



---

## ⚙️ How It Works

1. Jenkins pulls code from GitHub.
2. Builds Docker image from `app/`
3. Pushes image to Docker Hub.
4. SSH into EC2 → pulls + runs the container.

---

## 🚀 Quick Start

### 1. Jenkins Setup
- Install Jenkins on EC2 (with Docker)
- Add Docker Hub credentials (`dockerhub-creds`)
- Allow SSH to app server EC2

### 2. Deployment Script

**`scripts/deploy.sh`**:

```bash
#!/bin/bash
IMAGE=$1
docker stop flask-app || true
docker rm flask-app || true
docker pull $IMAGE
docker run -d --name flask-app -p 80:5000 $IMAGE
```



Once deployed, open your EC2 public IP in a browser:

```
http://<your-ec2-ip>
```


