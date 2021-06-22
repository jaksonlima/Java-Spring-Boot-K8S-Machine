pipeline {
  agent any

  stages {

    stage ('Get Source') {
      steps {
        git url: 'https://github.com/jaksonlima/Java-Spring-Boot-K8S-Machine', branch: 'main'
      }
    }

    stage('Docker Build') {
      steps {
        script {
          dockerapp = docker.build("jaksonsneider/spring:${env.BUILD_ID}",
          '-f ./Dockerfile .')
        }
      }
    }

    stage('Docker Push Image') {
      steps {
        script {
          docker.withResgisty('https://registry.hub.docker.com', 'dockerhub')
          dockerapp.push('latest')
          dockerapp.push("${env.BUILD_ID}")
        }
      }
    }
    
  }
}