pipeline{
    agent{
        label 'master'
    }
    stages{
        stage('checkout'){
            steps{
                script{
                   git credentialsId: 'DevOpsINT', url: 'https://github.com/DevOpsINT/Course.git'
                }
            }
        }
        stage('Script'){
            steps{
             withCredentials([usernamePassword(credentialsId: '910418bd-a13e-4d2a-96f4-692a77e4516a', passwordVariable: '_gitPass', usernameVariable: '_gitUser')]) {
              
                sh 'echo "trail2" >> newfile'
                sh 'git checkout tamir'
		sh 'git pull'
		sh 'gid add .'
                sh' git config --global user.name "DevOpsINT"'
                sh 'git config --global user.email "blabla@gmail.com"'
                sh 'git commit -m " upload file to github via jenkins "'
              
               
                sh 'git push  https://${_gitUser}:${_gitPass}@github.com/DevOpsINT/Course.git '
                
            
}
            }
        }
    }
}
