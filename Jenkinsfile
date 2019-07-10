def ls_command
pipeline {
	agent {
		label 'master'
	}
	stages {
		stage('checkout'){
			steps {
			dir('Course') {
				script {
					git credentialsId: 'DevOpsINT', url: 'https://github.com/DevOpsINT/Course.git'
				}
			}
			}
		}
		stage('shell command example') {
			steps {
				script {
					ls_command = sh script: 'pwd', returnStdout: true
					print(ls_command)
					sh "echo ls_command is ${ls_command} > gadi_file"
					sh label: '', script: 'echo "echo command is: Gadi This Is Your New File" > gadi_file'
					sh 'cat gadi_file'
				} 
			}
		}
		stage('push new file') {
                        steps {
				dir('Course') {
                                	script {
                                        	withCredentials([usernamePassword(credentialsId: 'DevOpsINT', passwordVariable: 'Password', usernameVariable: 'Username')]){
							sh('pwd')
							sh('git status')
							sh('git config --global user.name "Gadi"')
							sh('git config --global user.email "gadigamburg@gmail.com"')
							sh('git checkout gadi')
							sh('git pull')
							sh('echo testing > ifconfig.file')
							sh('git add .')
							sh('git commit -m "Auto Push Pipeline gadi_file"')
                                                	sh('git push https://${Username}:${Password}@github.com/DevOpsINT/gadi/Course.git')
						}
                                        }
                                        //Remark30
				}
			} 
		}

	}
}

