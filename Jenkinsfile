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
                withCredentials([usernamePassword(credentialsId: '6cea3ecc-ad83-44e2-82fe-aafb9c43ee94', passwordVariable: '_gitPass', usernameVariable: '_gitUser')]) {
                sh 'echo "trail333" >> newfile'
                sh 'git checkout tamir'
		sh 'git pull'
		sh 'gid add .'
                sh' git config --global user.name "DevOpsINT"'
                sh 'git config --global user.email "blabla@gmail.com"'
                sh 'git commit -m " upload file to github via jenkins "'
              	sh 'git push https://${_gitUser}:${_gitPass}@github.com/DevOpsINT/Course.git'
               
                }
            }
        }
    }
}
