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
          dockerapp = docker.build("jaksonsneider/spring:v${env.BUILD_ID}",
          "-f ./Dockerfile .")
        }
      }
    }

//     node {
//     checkout scm
//     sh './mvnw -B -DskipTests clean package'
//     docker.build("myorg/myapp").push()
// }

    stage('Docker Push Image') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com/', 'dockerhub')
          dockerapp.push('latest')
          dockerapp.push("v${env.BUILD_ID}")
        }
      }
    }
    
  }
}