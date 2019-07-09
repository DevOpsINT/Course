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
					sh 'echo "echo command is: This Is Your New File" > gadi_file'
					sh 'cat gadi_file'
				} 
			}
		}
		stage('push new file') {
                        steps {
                                script {
                                        withCredentials([usernamePassword(credentialsId: 'DevOpsINT', passwordVariable: 'Password', usernameVariable: 'Username')]){
						sh('git config --global user.name "Gadi"')
						sh('git config --global user.email "gadigamburg@gmail.com"')
						sh('git pull origin master')
						sh('git checkout gadi')
						sh('git add .')
						sh('git commit -m "Auto Push Pipeline"')
                                                sh('git push https://${Username}:${Password}@github.com/DevOpsINT/Course.git')
                                        }
                                        //Remark17
				} 
			} 
		}

	}
}

