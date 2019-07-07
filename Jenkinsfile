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
*/
		stage('push new file') {
			steps {
				script {
					withCredentials([usernamePassword(credentialId: 'DevOpsINT', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]){
						sh("git tag -a some_tag -m 'Auto Push Pipeline'")
						sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@gadi --tags')
					}
					//Remark1
				}
			}
		}
*/
	}
}













