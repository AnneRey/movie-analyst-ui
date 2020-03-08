pipeline {
    agent { label 'devops' }
    wrappers {
        credentialsBinding {
            amazonWebServicesCredentialsBinding {
            accessKeyVariable("AWS_ACCESS_KEY_ID")
            secretKeyVariable("AWS_SECRET_ACCESS_KEY")
            credentialsId("aws_credentials")
            }
        }
    }

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
        stage('Deploy with ansible: invoke ansible playbook front'){
            steps{
                sh "pwd"
                sh "ls"
                sh "printenv"
                sh "ansible-playbook -i inventory/aws.aws_ec2.yml playbook-deploy.yml"
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
