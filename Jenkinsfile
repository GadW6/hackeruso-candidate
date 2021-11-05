pipeline {
    agent any

    stages {
        stage('Create textfiles') {
            steps {
               sh './scripts/hello.sh'
               sh 'next'
            }
        }
        stage('Textfiles timestamps') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Set testfiles RO') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Build Nginx Docker') {
            steps {
                echo 'Deploying....'
            }
        }
        stage('Run Nginx') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}