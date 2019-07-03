def ls_command
pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                script {
                    git credentialsId: 'devopint', url: 'https://github.com/DevOpsINT/Course'
                }
            }
        }
        stage('shell command example') {
            steps {
                script {
                    //ls_command = sh script: 'pwd', returnStdout: true
                   // print(ls_command)
                   // sh "echo ls_command is ${ls_command} > vered"
                   // sh 'cat variable'
		    sh "git add ."
		    sh " git commit -m "vered" " 
		    sh " git push origin vered "
		    sh "echo DevopsINT"
		    sh "echo !Devopsshoam2019"	
                }
            }
        }
    }
}
