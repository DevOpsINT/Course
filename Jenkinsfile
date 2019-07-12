def ls_command
pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                script {
                    git credentialsId: 'devopint', url: 'https://github.com/DevOpsINT/Course.git'
                }
            }
        }
        stage('shell command example') {
            steps {
                script {
                    ls_command = sh script: 'pwd', returnStdout: true
                    print(ls_command)
                    sh "echo ls_command is ${ls_command} > variable"
                    sh 'cat variable'
                }
            }
        }
        stage('run ansible playbook') {
            steps {
                script {
                    sh 'ansible-playbook -i inventory.yml -u root -k --extra-vars "ansible_python_interpreter=/usr/bin/python3 service=nginx nginx_port=9000" playbook.yml'
                }
            }
        }
    }
}
