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
			withCredentials([usernamePassword(credentialsId: '910418bd-a13e-4d2a-96f4-692a77e4516a', passwordVariable: 'pass', usernameVariable: 'user')])
			{
		    sh 'echo ${pass}'
                    sh 'echo ${user}'
		    sh 'echo bambambam > newfile
                    sh 'echo git checkout tamir'
		    sh 'echo git add.'
		    sh 'echo git --global user.email bla@gmail.com'
               	    sh 'echo git --global user.name ${user}'
			sh 'echo git commit -m "push new file"'
                	sh 'git push  https://${pass}:${user}@github.com/DevOpsINT/Course.git '
                   
		    
                }
            }
	    }
        }
    }
}
