pipeline {
    agent any

    stages {
        stage('Create textfiles') {
            steps {
              sh "chmod +x -R ${env.WORKSPACE}"
              archiveArtifacts  artifacts: '**/*.txt'
                                allowEmptyArchive: false,
                                fingerprint: true,
                                onlyIfSuccessful: true
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