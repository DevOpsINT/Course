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
                      sh "echo \"${command_one_line_output}\" > outputfile"
                      sh "cat outputfile"
                      
                }
            }
        }
        stage('running ansible playbook'){
            steps{
                script{
                    def userInput = input(
                         id: 'userInput', message: 'Enter Host info:', ok: 'Continue', cancel: 'Cancel',
                            parameters: [

                                    string(defaultValue: '192.168.1.3',
                                            description: 'Remote host private ip',
                                            name: 'private_ip'),
                                    string(defaultValue: '/etc/ansible/hosts',
                                            description: 'Ansible default hosts file',
                                            name: 'ansible_hosts_path'),
                            ])
                    sh "echo [hosts] > $userInput.ansible_hosts_path"
                    sh "echo $userInput.private_ip >> $userInput.ansible_hosts_path"
                    sh'''
                      ansible-playbook  -e "service=docker jenkins_path=/opt/jenkins user=lidor port=8080" --private-key=~/.ssh/id_rsa  ~/playbook.yml 
                      
                    '''
                }
            }
        }
    }
}
