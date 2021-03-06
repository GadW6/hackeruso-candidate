node {
      stage('Create samplefiles') {
        try {
          def exists = fileExists 'artifacts'
          sh "chmod +x -R ${env.WORKSPACE}"
          if (exists) {
            sh 'rm -rf ./artifacts'
          }
          sh '''#!/bin/bash

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
          sh '''#!/bin/bash

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
          
          sh '''

            docker stop -t 0 web
            docker rm web

          '''

          def clone = fileExists 'hackeruso-candidate'
          if (clone) {
            sh 'rm -rf ./hackeruso-candidate'
          }

          sh 'git clone https://github.com/GadW6/hackeruso-candidate.git'

          sh 'docker build -t nginx_web -f ./hackeruso-candidate/Dockerfile.web .'

        } catch (err) {
          echo "Caught: ${err}"
        }
      }
      stage('Run Nginx') {
        try {
          sh 'docker run --name web -d -p 80:80 nginx_web'

        } catch (err) {
          echo "Caught: ${err}"
        }
      }
}