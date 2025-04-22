pipeline{
    agent any
    stages{
        stage("Stage 1"){
            steps{
                echo "Hello, World!"
                sh "sudo apt update && sudo apt upgrade -y"
                sh "sudo apt install docker.io -y && sudo apt install docker-compose -y"
                sh "docker --version && docker-compose --version"
            }
        }
    }
}