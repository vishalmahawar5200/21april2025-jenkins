pipeline {
    agent any
    environment {
        DOCKER_USERNAME = "vishalmahawar2200" // Your Docker Hub username
        DOCKER_PASSWORD = "xyfsfafa" // Your Docker Hub password
        DOCKER_IMAGE = "vishalmahawar2200/your-repository-name" // Your Docker image name
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'apt update && apt install -y docker.io sudo'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $DOCKER_IMAGE .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                // Login manually with the username and password
                sh "echo RJ09GC2017 | docker login -u vishalmahawar5200 --password-stdin"
            }
        }
        stage('Push Docker Image'){
            steps{
                sh "docker push vishalmahawar5200/21april2025"
            }
        }
    }