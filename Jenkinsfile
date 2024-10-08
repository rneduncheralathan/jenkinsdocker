pipeline {
    agent any

    stages {
        
        stage('Git Checkout') {
            steps {
                // Git Checkout
                script {
                    checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/rneduncheralathan/jenkinsdocker']])
                }
            }
        }
        
        // stage('Docker container Delete') {
        //     steps {
        //         // Delete Docker container
        //         sh 'docker rm -f jenkinsdocker-container'
        //     }
        // }
        
        stage('Docker Build') {
            steps {
                // Build Docker image
                script {
                    docker.build('jenkinsdocker:latest')
                }
            }
        }

        stage('Deploy') {
            steps {
                // Deploy Docker container
                sh 'docker run -d -p 8082:80 --name jenkinsdocker-container jenkinsdocker'
            }
        }
        
    }
}