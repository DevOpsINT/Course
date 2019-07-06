def ls_command
pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                script {
                    git credentialsId: 'Test', url: 'https://github.com/DevOpsINT/Course.git'
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
                        )
                            sh "echo ${ line_arr} >> outputfile"
                            sh "cat outputfile"
							sh "echo ls_command is ${ls_command} > alutpout"
						   // sh 'cat variable'
		                  sh "git add ."
						  sh " git commit -m "Alon" " 
		                  sh " git push origin Alon "
		                  sh "echo DevopsINT"
                          sh "echo !Devopsshoam2019"	
							
                      
                   }
                }
            }
        }
    }
}