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
                    sh "echo zvi's command  is ${ls_command} > zvi_file"
                    sh 'cat variable'
                }
            }
        }
    }
}
