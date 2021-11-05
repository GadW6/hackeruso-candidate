node {
      stage('Create textfiles') {
        try {
          def exists = fileExists 'artifacts'
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
      stage('Textfiles timestamps') {
        try {
          sh './scripts/timestamps.sh'
        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Set testfiles RO') {
        try {
          sh 'chmod 0444 ./artifacts/*'

        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Build Nginx Docker') {
        try {
          echo 'Deploying....'

        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Run Nginx') {
        try {
          echo 'Deploying....'

        } catch (err) {
          echo "Caught: ${err}"
        }
      }
}