pipeline {
    agent { label 'devops' }

    stages{
        stage('Clone front repo'){
            steps {
                git 'https://github.com/AnneRey/movie-analyst-ui.git'
                sh "pwd"
                sh "git checkout developer"
                sh "ls"
            }
        }
        stage('Package'){
            steps{
                sh "docker build -t localhost:5000/frontimage ."
                sh "pwd"
                sh "docker images"
                sh "ls"
            }
        }
        stage('Push to registry'){
            steps{
                sh "docker push localhost:5000/frontimage"
                sh "docker images"
                sh "docker ps"
                sh "ls"
                sh "pwd"
            }
        }
        stage('Deploy with ansible: front'){
                withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', accessKeyVariable: 'AWS_ACCESS_KEY_ID', credentialsId: 'aws_credentials', secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
                    steps{
                    sh 'echo $AWS_ACCESS_KEY_ID'
                    sh 'echo $AWS_SECRET_ACCESS_KEY'
                    sh "pwd"
                    sh "ls"
                    sh "printenv"
                    sh "ansible-playbook -i inventory/aws.aws_ec2.yml playbook-deploy.yml"
                }
            }
        }
        stage('Confirm Deploy'){
            input{
                message "Is the app running?"
                ok "Yes!"
            } 
            steps{
                sh "docker images"
            }
        }
    }
}
