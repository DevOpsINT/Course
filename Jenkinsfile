pipeline{
    agent{
        label 'master'
    }
    stages{
        stage('checkout'){
            steps{
                script{
                   git credentialsId: 'devopint', url: 'https://github.com/DevOpsINT/Course.git'
                }
            }
        }
        stage('scripting'){
            steps{
              withCredentials([usernamePassword(credentialsId: 'devopint', passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
              sh '''
                echo Hello World > newfile
                echo ${GIT_USERNAME}
                git config --global user.name "devopsint"
                git config --global user.email "devopsint@gmail.com"
                git pull origin master
                git checkout Yuvalez
                git add .
                git commit -m " Added new file within Jenkins file and pushed it to the repository (3)"
                git push  https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/DevOpsINT/Course.git 
                
              '''
}
            }
        }
    }
}
