pipeline {
    agent any

    stages {
        stage('Create textfiles') {
            steps {
              sh "chmod +x -R ${env.WORKSPACE}"
              sh './scripts/hello.sh'
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