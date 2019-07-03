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
		    sh 'echo touch mymy'
                    sh 'echo hello > mymy '
                    sh 'echo git checkout tamir'
		    sh 'echo git add.'
		    sh 'echo git --global user.email "bla@gmail.com"'
               	sh 'echo git --global user.name "DevOpsINT'
                    sh 'echo git commit -m "added new file via jenkins job"
                    sh 'echo git push origin tamir'
                    
		    
                }
            }
        }
    }
}
