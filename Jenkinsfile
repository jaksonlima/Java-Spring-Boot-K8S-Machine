pipeline {
  agent any

  stages {

    stage ('Get Source') {
      steps {
        git url: 'https://github.com/jaksonlima/Java-Spring-Boot-K8S-Machine', branch: 'main'
      }
    }

    stage('Back-end') {
      agent {
         docker { image 'maven:3.8.1-adoptopenjdk-11' }
      }
      steps {
        sh 'echo "################################"'
        sh 'mvn --version'
        sh 'mvn clean install'
        sh 'echo "################################"'
     }
  }

    // stage('Compile Project') {
    //   staps {
    //     agent any
    //   }
    // }

    // stage('Docker Build') {
    //   steps {
    //     script {
    //       dockerapp = docker.build("jaksonsneider/spring:v${env.BUILD_ID}",
    //       "-f ./Dockerfile .")
    //     }
    //   }
    // }

    // stage('Docker Push Image') {
    //   steps {
    //     script {
    //       sh "docker logout"
    //       docker.withRegistry('https://registry.hub.docker.com', 'dockerhub', {})
    //       dockerapp.push('latest')
    //       dockerapp.push("v${env.BUILD_ID}")
    //     }
    //   }
    // }
    
  }
}