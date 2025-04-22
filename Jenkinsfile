pipeline {
    agent any
    environment {
        DOCKER_USERNAME = "vishalmahawar2200"
        DOCKER_PASSWORD = "RJ09GC2017"
        DOCKER_IMAGE = "vishalmahawar2200/21april2025"
    }
    stages {
        stage('Install Dependencies') {
            steps {
                sh 'apt update && apt install -y docker.io sudo'
            }
        }

        stage('Verify Docker Version') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'sudo docker build -t vishal:t1 .'
            }
        }

        stage('Login to Docker Hub') {
            steps {
                sh 'echo $DOCKER_PASSWORD | sudo docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'sudo docker push vishalmahawar5200/21april2025:v1'
            }
        }
    }
}
