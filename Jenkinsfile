pipeline {
  agent any
  stages {
    stage('Compile') {
      agent {
        docker{
          image 'maven:sapmachine'
          args '-u root'
        }
      }
      steps {
        sh 'mvn compile'
      }
    }
    stage('Static Code Analysis') {
      agent {
        docker{
          image 'maven:sapmachine'
          args '-u root'
        }
      }
      steps {
        sh 'mvn pmd:pmd'
      }
    }
    stage('Test and Build') {
      agent {
        docker{
          image 'maven:sapmachine'
          args '-u root'
        }
      }
      steps {
        sh 'mvn test'
        sh 'mvn clean package'
      }
    }

    stage('Docker build and push') {
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
            cd ${WORKSPACE}
            '''
            // docker build -t gopinath2029/addressbook:$BUILD_NUMBER .
            // docker push gopinath2029/addressbook:$BUILD_NUMBER
          // '''
        }
      }
    }
  }
}
