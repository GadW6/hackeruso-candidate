node {
      stage('Create samplefiles') {
        try {
          def exists = fileExists 'artifacts'
          sh "chmod +x -R ${env.WORKSPACE}"
          if (exists) {
            sh 'rm -rf ./artifacts'
          }
          sh '''

            mkdir artifacts
            cd ./artifacts/
            touch sample{01..10}.txt

            for FILENAME in *.txt; do
                echo 'Some default content' > "$FILENAME"
            done

          '''
        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Samplefiles timestamps') {
        try {
          sh '''

            cd ./artifacts/

            TIME_DATE=$(date)
            TIME_ZONE=$(date +%Z)

            for FILENAME in *.txt; do
                echo "Date: $TIME_DATE - $TIME_ZONE" >> "$FILENAME"
            done

          '''
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
          // sh '''

          //   archiveArtifacts  artifacts: 'artifacts/*.txt',
          //                     allowEmptyArchive: false,
          //                     fingerprint: true,
          //                     onlyIfSuccessful: true

          // '''

          sh '''

            docker stop -t 0 web
            docker rm web

          '''
          // sh 'docker run --name web -d -p 80:80 -v ./artifacts/:/usr/local/apache2/htdocs/ nginx'

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