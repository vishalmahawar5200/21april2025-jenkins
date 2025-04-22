pipeline {
    agent any
    environment {
        DOCKER_USERNAME = "vishalmahawar5200"
        DOCKER_PASSWORD = "RJ09GC2017"
        DOCKER_IMAGE = "vishalmahawar2200/21april2025"
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
          stage('Start Docker Daemon (if not running)') {
            steps {
                sh '''
                    # Try starting Docker daemon in background if not active
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

    stage('Verify Docker Version') {
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
            steps {
                sh 'echo $DOCKER_PASSWORD | docker login -u $DOCKER_USERNAME --password-stdin'
            }
        }

        stage('Push Docker Image') {
            steps {
                sh 'docker tag vishal:t1:v1'
                sh 'docker push vishalmahwar5200/21april2025:v1'
            }
        }
    }
}
