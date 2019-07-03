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
                    sh 'touch tamirnewfile'
                    sh 'git checkout tamir'
		    sh 'git add.'
		    sh 'git --global user.email "bla@gmail.com"'
               	sh 'git --global user.name "DevOpsINT'
                    sh 'git commit -m "added new file via jenkins job"
                    sh 'git push origin tamir'
                    sh 'DevOpsINT'
		    sh '!Devopsshoam2019'
                }
            }
        }
    }
}
