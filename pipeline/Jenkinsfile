#!/usr/bin/env groovy
pipeline {
    agent any
    environment {
        AWS_ACCESS_KEY_ID = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        AWS_DEFAULT_REGION = "us-east-1"
    }
    stages {
        stage("Create an EKS Cluster") {
            steps {
                script {
                    dir('terraform') {
                        sh "terraform init"
                        sh "terraform apply -auto-approve"
                    }
                }
            }
        }
        stage("Deploy to EKS") {
            steps {
                script {
                    dir('k8s') {
                        sh "aws eks update-kubeconfig --name myapp-eks-cluster"
                        sh "kubectl apply -f ws-deployment.yml"
                        sh "kubectl apply -f service.yml"
                        sh "kubectl apply -f postgres-deployment.yml"
                        sh "kubectl apply -f postgres-cluster-ip-service.yml"
                        sh "kubectl apply -f ingress-service.yml"
                        sh "kubectl apply -f database-persistent-volume-claim.yml"
                        sh "kubectl apply -f client-cluster-ip-service.yml"
                    }
                }
            }
        }
    }
}