    
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
                        dir('ansible') {
                              sh "sed -i 's/IP_ADDR/$userInput/' hosts"
                              sh '''
                              ansible-playbook -vvvvv -i hosts  -e "user=lidor service=docker es_pr_port=9200 es_leg_port=9300 kibana_port=5601 kibana_host_path=/opt/kibana elastic_host_path=/opt/elastissearch/data elastic_container_path=/usr/share/elasticsearch/data kibana_container_path=/usr/share/kibana/config"  --private-key=/var/jenkins_home/.ssh/id_rsa playbook.yml
                               '''
                            }    
                  
                }
            }
        }
    }
}
