pipeline {
  agent any
  stages {
    // stage('compile') {
    //   agent {
    //     docker{
    //       image 'maven:sapmachine'
    //       args '-u root'
    //     }
    //   }
    //   steps {
    //     sh 'mvn compile'
    //   }
    // }
    // stage('codereview') {
    //   agent {
    //     docker{
    //       image 'maven:sapmachine'
    //       args '-u root'
    //     }
    //   }
    //   steps {
    //     sh 'mvn pmd:pmd'
    //   }
    // }
    // stage('test') {
    //   agent {
    //     docker{
    //       image 'maven:sapmachine'
    //       args '-u root'
    //     }
    //   }
    //   steps {
    //     sh 'mvn test'
    //   }
    // }
    // stage('package') {
    //   agent {
    //     docker{
    //       image 'maven:sapmachine'
    //       args '-u root'
    //     }
    //   }
    //   steps {
    //     sh 'mvn clean package'
    //   }
    // }
    // stage('Build docker image') { 
    //   agent none
    //   steps {
    //     sh 'cd /Users/gopinath/.jenkins/workspace/myapp/'
    //     sh 'docker build -t myapp .'
    //   }
    // }
    stage('login to dockerhub'){
      agent none
      steps{
        withCredentials ([usernamePassword(
          credentialsId: 'c1b55dea-6f5e-4d6e-ac39-eff459b773be',
          usernameVariable: 'DOCKER_USER',
          passwordVariable: 'DOCKER_PASS'
        )])
        {
          sh '''
            echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
            cd /Users/gopinath/.jenkins/workspace/myapp/
            docker build -t gopinath2029/addressbook:$BUILD_NUMBER .
            docker push gopinath2029/addressbook:$BUILD_NUMBER
          '''
        }
      }
    }
  }
}
