pipeline {
    agent any

    stages {
        stage('Create textfiles') {
            steps {
              fileExists file: 'artifacts/*.txt'
              sh "chmod +x -R ${env.WORKSPACE}"
              sh "./scripts/textfiles.sh ${fileExists}"
              // archiveArtifacts  artifacts: 'artifacts/*.txt',
              //                   allowEmptyArchive: false,
              //                   fingerprint: true,
              //                   onlyIfSuccessful: true
            }
        }
        stage('Textfiles timestamps') {
            steps {
              sh './scripts/timestamps.sh'
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