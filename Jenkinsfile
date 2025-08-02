pipeline {
    agent {
        docker {
            image 'python:3.10-slim'
            // Add these arguments to fix permission issues
            args '-u root -v /tmp/pip_cache:/tmp/pip_cache'
        }
    }
    
    environment {
        // Set PIP cache directory
        PIP_CACHE_DIR = '/tmp/pip_cache'
    }
    
    stages {
        stage('Install') {
            steps {
                dir('app') {
                    // Install with --user flag or in virtualenv
                    sh '''
                        python -m pip install --upgrade pip
                        pip install --user -r requirements.txt
                        export PATH=$PATH:/root/.local/bin
                    '''
                }
            }
        }
        
        stage('Test') {
            steps {
                dir('app') {
                    sh 'pytest test_main.py -v'
                }
            }
            post {
                always {
                    junit 'app/test-results.xml'  // Save test results
                }
            }
        }
        
        stage('Run App') {
            steps {
                dir('app') {
                    sh 'python main.py'
                }
            }
            post {
                success {
                    echo 'Application started successfully'
                }
                failure {
                    echo 'Failed to start application'
                }
            }
        }
    }
    
    post {
        always {
            cleanWs()  // Clean workspace after build
        }
    }
}