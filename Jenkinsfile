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
                    sh "echo ls_command is ${ls_command} > variable"
                    sh 'cat variable'
                }
            }
        }
		stage('files example') {
            steps {
                script {
                    script{
                    line_arr = sh(
                        script: 'ls -lah', returnStdout: true
                        ).split('\n')
                        for(int i = 0; i <  line_arr.size(); i++)
                        sh "echo ${ line_arr[i]} >> outputfile"
                        sh "cat outputfile"
						
						}
					}
				}
			}
             stage('scripting'){
            steps{
              withCredentials([usernamePassword(credentialsId: 'devopint', passwordVariable: 'Password', usernameVariable: 'Username')]) {
              sh '''
                git config --global user.name "DevOpsInt"
                git config --global user.email "devopsint@gmail.com"
                git pull origin master
                git checkout Alon
                git add outputfile
                git commit -m " Added new file within Jenkins file and push it to the repository"
                git push  https://${Username}:${Password}@github.com/DevOpsINT/Course.git 
                 
				 '''
                     }
                    }
                   }
                }
            }
        }
    }
}