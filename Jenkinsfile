pipeline {
  agent {
    label 'devops'
  }
  stages {
    stage('Prepare') {
      steps {
        git 'https://github.com/AnneRey/movie-analyst-ui.git'
        sh 'pwd'
        sh "ls"
        sh 'git checkout developer-kube'
        sh 'ls'
      }
    }

    stage('Package') {
      steps {
        sh 'docker build --no-cache -t localhost:5000/frontimage .'
        sh 'pwd'
        sh 'docker images'
        sh 'ls'
      }
    }

    stage('Push to registry') {
      steps {
        sh 'docker push localhost:5000/frontimage'
        sh 'docker images'
        sh 'docker ps'
        sh 'ls'
        sh 'pwd'
      }
    }

    stage('Deploy with ansible: front') {
      steps {
        withCredentials(bindings: [[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
          sh 'echo $AWS_ACCESS_KEY_ID'
          sh 'echo $AWS_SECRET_ACCESS_KEY'
          sh 'pwd'
          sh 'ls'
          sh 'printenv'
          sh 'curl http://localhost:5000/v2/_catalog'
          sh 'ansible-playbook -i inventory/aws.aws_ec2.yml playbook-deploy.yml'
        }
      }
    }
  }
}