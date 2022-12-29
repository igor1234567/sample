pipeline {
        agent {
  label 'centos7'
        } 

    stages {
        stage('Checkout Code') {
            steps {
                cleanWs()
                checkout([$class: 'GitSCM', branches: [[name: '*/main']], extensions: [[$class: 'RelativeTargetDirectory', relativeTargetDir: 'app_sample']], userRemoteConfigs: [[url: 'https://github.com/digitalocean/sample-nodejs.git']]])
            }
        }
        stage('build docker') {
                steps {
                    sh 'pwd'
                    sh 'ls'
                    sh "docker build -t igorripin/sample_nodejs:${BUILD_ID} ."
                }
            }
        stage('run') {
            steps {
                sh "docker run -itd -p 3000:3000 --name sample_container igorripin/sample_nodejs:${BUILD_ID}"
               
            }
        }
        stage('Test') {
            steps {
                //sh 'nohup node index.js &'
                sh 'curl localhost:3000'
   
            }
        }
        stage('Package') {
            steps {
                sh "tar -czvf package-${BUILD_ID}.tar.gz *"
                archive '*.tar.gz'
            }
        }
    }
    post {
        always {
             chuckNorris()  
              
            }
        /*aborted {
             slackSend channel: '#general', message: 'build was aborted'
         }
        failure {
              slackSend channel: '#general', message: 'build is failing '
         }
        fixed {
          slackSend channel: '#general', message: 'someone fixed the build, now its ok.'
         }*/
    }

}
