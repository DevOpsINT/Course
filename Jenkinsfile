def command_few_lines
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
                    command_few_lines = sh(
                        script: 'ls -lah', returnStdout: true
                        ).split('\n')
                        for(int i = 0; i < command_few_lines.size(); i++)
                            sh "echo ${command_few_lines[i]} >> outputfile"
                        sh "cat outputfile"
                      
                }
            }
        }
    }
}
