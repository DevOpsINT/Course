def command_one_line_output
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
                script{
                    command_one_line_output = sh(
                        script: 'pwd', returnStdout: true
                        ).trim()
                        sh  "echo ${command_one_line_output} > outputfile"
                        sh "cat outputfile"
                      
                }
            }
        }
    }
}
