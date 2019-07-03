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
			ls_command = ls_command.trim()
                    sh "echo ls_command is ${ls_command} > newfile"
                    sh 'cat newfile'
                }
            }
        }
    }
}
