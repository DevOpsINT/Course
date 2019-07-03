def echo
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
                    echo = sh script: 'echo good >file', returnStdout: true
                    print(echo)
                    sh "echo echo is ${echo} > variable"
                    sh 'cat variable'
                }
            }
        }
    }
}
