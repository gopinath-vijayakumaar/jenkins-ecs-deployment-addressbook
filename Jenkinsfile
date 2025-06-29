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
    // stage('codereview') {
    //   steps {
    //     sh 'mvn pmd:pmd'
    //   }
    // }
    // stage('test') {
    //   steps {
    //     sh 'mvn test'
    //   }
    // }
    stage('package') {
      steps {
        sh 'mvn clean package'
      }
    }
    stage('docker build') {
        steps {
            sh 'docker build -t addressapp .'
            sh 'docker images'
        }
    }
  }
}