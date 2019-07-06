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
                        sh ¨git checkout Alon¨
                   }
                }
            }
        }
    }
}