node {
      stage('Create samplefiles') {
        try {
          def exists = fileExists 'artifacts'
          sh "chmod +x -R ${env.WORKSPACE}"
          sh "./scripts/samplefiles.sh ${exists}"
          // archiveArtifacts  artifacts: 'artifacts/*.txt',
          //                   allowEmptyArchive: false,
          //                   fingerprint: true,
          //                   onlyIfSuccessful: true
        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Samplefiles timestamps') {
        try {
          sh './scripts/timestamps.sh'
        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Set Samplefiles RO') {
        try {
          sh 'chmod 0444 ./artifacts/*'

        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Build Nginx Docker') {
        try {
          def web = docker.image('nginx').run('web')
          web.withRun('-p 80:80')


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