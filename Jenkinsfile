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
        stage('scripting'){
            steps{
              withCredentials([usernamePassword(credentialsId: 'DevOpsInt', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
              sh '''
                echo Helo World > newfile
                echo ${GIT_USERNAME}
                git config --global user.name "lioran1990W"
                git config --global user.email "devopsint@gmail.com"
                git pull origin master
                git checkout lranBranch
                git add .
                git commit -m " Added new file within Jenkins file and push it to the repository July 12,2019"
                git push  https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/DevOpsINT/Course.git 
                
              '''
}
            }
        }
    }
}
