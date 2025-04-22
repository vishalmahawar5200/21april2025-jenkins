pipeline{
    agent any
    stages{
        stage("Stage 1"){
            steps{
                echo "Hello, World!"
                sh "apt update && apt upgrade -y"
                sh "apt install sudo -y"
                sh "sudo apt install docker.io -y && sudo apt install docker-compose -y"
                sh "docker --version && docker-compose --version"
            }
        }
    }
}