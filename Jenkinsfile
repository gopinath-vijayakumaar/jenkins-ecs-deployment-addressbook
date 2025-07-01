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
    stage('Build docker image') { 
      agent none
      steps {
        sh 'cd /Users/gopinath/.jenkins/workspace/myapp/'
        sh 'docker build -t '
      }
    }
  }
}
