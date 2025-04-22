pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "vishalmahawar5200/21april2025"
    }

    stages {
        stage('Install Dependencies') {
            steps {
                sh '''
                    apt update
                    apt install -y docker.io sudo
                '''
            }
        }

        stage('Start Docker Daemon') {
            steps {
                sh '''
                    if ! pgrep dockerd > /dev/null; then
                        echo "Starting Docker daemon..."
                        nohup dockerd > /tmp/dockerd.log 2>&1 &
                        sleep 10
                    else
                        echo "Docker daemon is already running"
                    fi
                '''
            }
        }

        stage('Check Docker Version') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t vishal:t1 .'
            }
        }

        stage('Login to Docker Hub') {
            environment {
                DOCKER_CREDENTIALS = credentials('dockerhub-creds')
            }
            steps {
                sh 'echo $DOCKER_CREDENTIALS_PSW | docker login -u $DOCKER_CREDENTIALS_USR --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    def imageTag = "v${env.BUILD_NUMBER}"
                    def fullImage = "${DOCKER_IMAGE}:${imageTag}"
                    sh """
                        docker tag vishal:t1 ${fullImage}
                        docker push ${fullImage}
                        docker tag ${fullImage} ${DOCKER_IMAGE}:latest
                        docker push ${DOCKER_IMAGE}:latest
                    """
                }
            }
        }

        stage('Deploy to Deploy Server') {
            steps {
                script {
                    def imageTag = "v${env.BUILD_NUMBER}"
                    def fullImage = "${DOCKER_IMAGE}:${imageTag}"
                    sh """
                        ssh root@37.27.210.146 '
                            docker pull ${fullImage} &&
                            docker tag ${fullImage} ${DOCKER_IMAGE}:latest &&
                            cd /home/ubuntu/app &&
                            docker-compose down &&
                            docker-compose up -d
                        '
                    """
                }
            }
        }
    }
}
