pipeline {
    agent any
    stages{
        stage('Clone'){
            steps {
                git 'https://github.com/AnneRey/movie-analyst-ui.git'
                sh "pwd"
                sh "ls"
            }
        }
        stage('Package'){
            steps{
                sh "docker build -t movie-analyst-ui localhost:5000/frontimage"
                sh "docker images"
            }
        }
        stage('Push to registry'){
            steps{
                sh "docker push localhost:5000/frontimage"
            }
        }
    }
}
