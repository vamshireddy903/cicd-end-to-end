pipeline {
    
    agent any 
    
    environment {
        IMAGE_TAG = "${BUILD_NUMBER}"
        DOCKER_IMAGE = "vamshi589/ci-cd-e2e:${BUILD_NUMBER}"
    }
    
    stages {
        
        stage('Checkout') {
            steps {
                git branch: 'main', 
                    credentialsId: 'github', 
                    url: 'https://github.com/vamshireddy903/cicd-end-to-end.git'
            }
        }

        stage('Build Docker') {
            steps {
                script {
                    sh '''
                    echo "🛠️ Building Docker Image..."
                    docker build -t $DOCKER_IMAGE .
                    '''
                }
            }
        }

         stage("Push to Docker Hub") {
            steps {
                echo "📦 Pushing the image to Docker Hub"
                withCredentials([usernamePassword(
                    credentialsId: "dockerhub", 
                    passwordVariable: "dockerpass", 
                    usernameVariable: "dockeruser"
                )]) { 
                    sh """
                    echo "🔐 Logging into Docker Hub..."
                    docker login -u $dockeruser -p $dockerpass
                    echo "🚀 Pushing image..."
                    docker push $DOCKER_IMAGE
                    """
                }
            }
        }
    }
}
