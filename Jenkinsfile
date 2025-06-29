pipeline {
  agent {
    docker { 
        image 'maven:sapmachine'
        args '-u root'
            }
  }
  stages {
    stage('git pull') {
      steps {
        sh 'git clone https://github.com/gopinath-vijayakumaar/DevOpsCodeDemo.git'
      }
    }
    stage('compile') {
      steps {
        sh 'mvn compile'
        sh 'mvn test'
      }
    }
  }
}