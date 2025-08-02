pipeline {
    agent {
        docker {
            image 'python:3.10-slim'
        }
    }
    stages {
        stage('Prepare Virtual Environment') {
            steps {
                dir('app') {
                    sh 'python3 -m venv .venv' // Create a virtual environment named ".venv"
                }
            }
        }
        stage('Install Dependencies') {
            steps {
                dir('app') {
                    sh 'source .venv/bin/activate && pip install -r requirements.txt' // Activate and install requirements
                }
            }
        }
        stage('Test') {
            steps {
                dir('app') {
                    sh 'source .venv/bin/activate && pytest test_main.py' // Activate and run tests
                }
            }
        }
        stage('Run App') {
            steps {
                dir('app') {
                    sh 'source .venv/bin/activate && python main.py' // Activate and run the app
                }
            }
        }
    }
}
