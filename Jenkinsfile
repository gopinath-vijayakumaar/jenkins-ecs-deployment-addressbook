pipeline {
  agent {
    docker { 
        image 'maven:sapmachine'
        args '-u root'
            }
  }
  stages {
    stage('compile') {
      steps {
        sh 'mvn compile'
      }
    }
    stage('test') {
      steps {
        sh 'mvn compile'
        sh 'mvn test'
      }
    }
  }
}