pipeline {
    agent any

    environment {
        WORKDIR = "${env.WORKSPACE}/app"
        IMAGE_NAME = 'ci-demo-image'
        CONTAINER_NAME = 'ci-demo-container'
    }

    stages {

        stage('Verify Docker') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                    cd $WORKDIR
                    docker build -t $IMAGE_NAME .
                '''
            }
        }

        stage('Run Docker Container') {
            steps {
                sh '''
                    docker rm -f $CONTAINER_NAME || true
                    docker run --name $CONTAINER_NAME $IMAGE_NAME
                '''
            }
        }
    }

    post {
        always {
            echo 'Pipeline execution finished.'
        }
    }
}

