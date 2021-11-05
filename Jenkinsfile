pipeline {
    agent any

    stages {
        stage('Create textfiles') {
            steps {
              archiveArtifacts  artifacts: '**/*.txt'
              sh "chmod +x -R ${env.WORKSPACE}"
              sh 'ls'
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