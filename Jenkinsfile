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
		stage('push new file') {
                        steps {
                                script {
                                        withCredentials([usernamePassword(credentialsId: 'DevOpsINT', passwordVariable: '!Devopsshoam2019', usernameVariable: 'DevOpsInt')]){
						sh('git config --global user.name "Gadi"')
						sh('git config --global user.email "gadigamburg@gmail.com"')
						sh('git pull')
						sh('git add .')
						sh('git commit -m 'Auto Push Pipeline')
                                                sh('git push https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/DevOpsINT/Course.git')
                                        }
                                        //Remark6
				} 
			} 
		}

	}
}

