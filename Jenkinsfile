pipeline {
    agent {
        docker {
            image 'python:3.10-slim'
        }
    }
    stages {
        stage('Install') {
            steps {
                dir('app') {
                    sh 'sudo pip install -r requirements.txt'
                }
            }
        }
        stage('Test') {
            steps {
                dir('app') {
                    sh 'sudo pytest test_main.py'
                }
            }
        }
        stage('Run App') {
            steps {
                dir('app') {
                    sh 'sudo python main.py'
                }
            }
        }
    }
}
