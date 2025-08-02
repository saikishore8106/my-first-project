pipeline {
    agent {
        docker {
            image 'python:3.10-slim'
        }
    }
    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/your-username/python-jenkins-docker.git'  // or use local repo
            }
        }
        stage('Install') {
            steps {
                dir('app') {
                    sh 'pip install -r requirements.txt'
                }
            }
        }
        stage('Test') {
            steps {
                dir('app') {
                    sh 'pytest test_main.py'
                }
            }
        }
        stage('Run App') {
            steps {
                dir('app') {
                    sh 'python main.py'
                }
            }
        }
    }
}
