pipeline {
    agent any

    environment {
        TF_VERSION = '1.2.2'
        AWS_SHARED_CREDENTIALS_FILE = credentials('aws_creds')
        AWS_DEFAULT_REGION = 'us-east-1'
        AWS_DEFAULT_PROFILE = "BE-LIKE-BRO"
    }

    stages {
        stage('Setup Environment') {
            steps {
                deleteDir()
                checkout scm
                sh """
                   wget -q https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip
                   unzip -o terraform_${TF_VERSION}_linux_amd64.zip -d "${WORKSPACE}/bin"
                   """
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("Terraform") {
                    sh "terraform init"
                    sh "terraform plan"
                }
            }
        }

        // stage('Terraform Apply') {
        //     input {
        //         message "Do you want to apply this change?"
        //     }
        //     steps {
        //         dir("Terraform") {
        //             sh "terraform apply"
        //         }
        //     }
        // }
    }
}
