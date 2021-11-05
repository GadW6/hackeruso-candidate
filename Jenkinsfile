pipeline {
    agent any

    stages {
        stage('Create textfiles') {
            steps {
              node {
                try {
                  def exists = fileExists 'artifacts/sample01.txt'
                  sh "chmod +x -R ${env.WORKSPACE}"
                  sh "./scripts/textfiles.sh ${exists}"
                  // archiveArtifacts  artifacts: 'artifacts/*.txt',
                  //                   allowEmptyArchive: false,
                  //                   fingerprint: true,
                  //                   onlyIfSuccessful: true
                } catch (err) {
                  echo "Caught: ${err}"
                }
              }
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