pipeline {
    agent {
        docker {
            image 'python:3.10-slim'
            args '-u root -v /tmp/pip_cache:/tmp/pip_cache'
        }
    }
    
    environment {
        PIP_CACHE_DIR = '/tmp/pip_cache'
        PATH = "/usr/local/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/root/.local/bin"
    }
    
    stages {
        stage('Install') {
            steps {
                dir('app') {
                    sh '''
                        python -m pip install --upgrade pip
                        pip install --user -r requirements.txt
                    '''
                }
            }
        }
        
        stage('Test') {
            steps {
                dir('app') {
                    sh '''
                        export PATH=$PATH:/root/.local/bin
                        pytest test_main.py -v --junitxml=test-results.xml
                    '''
                }
            }
            post {
                always {
                    junit 'app/test-results.xml'
                }
            }
        }
        
        stage('Run App') {
            steps {
                dir('app') {
                    sh '''
                        export PATH=$PATH:/root/.local/bin
                        python main.py
                    '''
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()
        }
    }
}