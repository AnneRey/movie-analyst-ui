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
        stage('Clone devops repo'){
            steps{
                sh "cd ../"
                git 'https://github.com/AnneRey/infrastructure-configuration.git'
                sh "pwd"
                sh "git checkout developer"
                sh "ls"
            }
        }
        stage('Package'){
            steps{
                sh "cd movie-analyst-ui"
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
            }
        }
        stage('Deploy with ansible: invoke ansible playbook front'){
            steps{
                sh "pwd"
                sh "cd infrastructure-configuration/ansible"
                sh "ansible-playbook playbook-deploy.yml"
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
