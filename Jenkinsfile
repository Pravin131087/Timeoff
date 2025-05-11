pipeline {
    agent any

    environment {
        AWS_REGION = 'us-east-1'
        ECR_REPO_NAME = 'timeoff'
        ECR_URL = "229951520630.dkr.ecr.us-east-1.amazonaws.com/timeoff"
        IMAGE_TAG = "latest"
        CLUSTER_NAME = "ecs-cluster"
        SERVICE_NAME = "ecr-task-def-service-8k1iumj9"
        TASK_DEF_FAMILY = "ecr-task-def"
        CONTAINER_NAME = "ECS-Container"     }

    stages {
        stage('Checkout') {
            steps {
<<<<<<< HEAD
<<<<<<< HEAD
                 git url: 'https://github.com/Naveen-love/timeoff-management-application.git'
=======
                 git url: 'git@github.com:Pravin131087/Timeoff.git'
>>>>>>> 2e913b0839ded91ba72a51ea9a7474c96fe911a3
=======
                 git url: 'git@github.com:Pravin131087/Timeoff.git'
>>>>>>> f8dc020b83a51a992a96ffcc3b51573ba9b42c01
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${ECR_URL}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Login to ECR') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS_ID']]) {
                        sh """
                            aws ecr get-login-password --region ${AWS_REGION} | docker login --username AWS --password-stdin ${ECR_URL}
                        """
                    }
                }
            }
        }

        stage('Push Docker Image') {
            steps {
                script {
                    sh "docker push ${ECR_URL}:${IMAGE_TAG}"
                }
            }
        }

        stage('Deploy to ECS') {
            steps {
                script {
                    withCredentials([[$class: 'AmazonWebServicesCredentialsBinding', credentialsId: 'AWS_CREDENTIALS_ID']]) {
                        // Get current task definition
                        sh """
                            aws ecs update-service \
                              --cluster ${CLUSTER_NAME} \
                              --service ${SERVICE_NAME} \
                              --force-new-deployment \
                              --region ${AWS_REGION}
                        """
                    }
                }
            }
        }
    }
}
