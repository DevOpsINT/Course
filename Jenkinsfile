def ls_command
pipeline {
	agent {
		label 'master'
	}
	stages {
		stage('checkout'){
			steps {
				script {
					git credentialsId: 'DevOpsINT', url: 'https://github.com/DevOpsINT/Course.git'
				}
			}
		}
		stage('shell command example') {
			steps {
				script {
					ls_command = sh script: 'pwd', returnStdout: true
					print(ls_command)
					sh "echo ls_command is ${ls_command} > gadi_file"
					sh 'cat gadi_file'
				} 
			}
		}
	}
}

