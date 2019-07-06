pipeline{
    agent{
        label 'master'
    }
    stages{
        stage('checkout'){
            steps{
                script{
                   git credentialsId: 'DevOpsInt', url: 'https://github.com/DevOpsINT/Course.git'
                }
            }
        }
        stage('Script'){
            steps{
             withCredentials([usernamePassword(credentialsId: '910418bd-a13e-4d2a-96f4-692a77e4516a', passwordVariable: '_gitPass', usernameVariable: '_gitUser')]) {
              sh '''
                echo sometext > newfile
                git checkout tamir
				git pull
				gid add .
                git config --global user.name "DevOpsINT"
                git config --global user.email "blabla@gmail.com"
                git commit -m " upload file to github via jenkins "
              
               
                git push  https://${_gitUser}:${_gitPass}@github.com/DevOpsINT/Course.git 
                
              '''
}
            }
        }
    }
}