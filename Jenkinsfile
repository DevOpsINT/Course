pipeline{
    options {
  timeout(5)
}

    agent{
        label 'master'
    }
    stages{
        stage('checkout'){
            steps{
                script{
                   
                        git branch: 'Lidor', credentialsId: 'dcacc4ee-0dab-4a7f-b781-ad2b883bfe68', url: 'https://github.com/DevOpsINT/Course.git'                
                    
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
                            ])
                        dir('ansible/proj') {
                              sh "sed -i 's/IP_ADDR/$userInput/' hosts"
                              sh '''
                              ansible-playbook -vvvvv -i hosts  -e "service=docker jenkins_path=/opt/jenkins user=lidor port=8080" --private-key=/var/jenkins_home/.ssh/id_rsa playbook.yml
                              '''
                            }    
                  
                }
            }
        }
    }
}
