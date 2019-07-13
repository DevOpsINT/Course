def command_one_line_output
pipeline{
    agent{
        label 'master'
    }
    parameters {
        string(defaultValue: "192.168.1.3", description: 'HOST IP:', name: 'private_ip')
        string(defaultValue: "/etc/ansible/hosts", description: 'Ansible HOSTS PATH:', name: 'ansible_hosts_path')

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
                       sh "echo \"${command_one_line_output}\" > outputfile"
                       sh "cat outputfile"
                      
                }
            }
        }
        stage('running ansible playbook'){
            steps{
                script{
                    sh "echo [hosts] > $ansible_hosts_path"
                    sh "echo $private_ip >> $ansible_hosts_path"
                    sh'''
                      ansible-playbook  -e "service=docker jenkins_path=/opt/jenkins user=lidor port=8080" --private-key=~/.ssh/id_rsa  ~/playbook.yml 
                      
                    '''
                }
            }
        }
    }
}
