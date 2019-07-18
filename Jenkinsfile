pipeline {
    agent {
        label 'master'
    }
       options {
  timeout(5)
       }
    stages {
            stage('checkout') {
              steps{
                script{
                    git branch: 'Lidor', credentialsId: 'dcacc4ee-0dab-4a7f-b781-ad2b883bfe68', url: 'https://github.com/DevOpsINT/Course.git'
                }
            
              }
            }
            stage('running ansible playbook'){
                steps{
                    script{
                    ip_list = sh(
                    script: 'cat ./ansible/proj/ip_list', returnStdout: true)
                    def target_ip = input message: 'Please choose host ip:', parameters: [ choice(name: '', choices: ip_list, description: 'host ip to run playbook')]
                    dir('ansible/proj'){
                        sh "sed -i 's/IP_ADDR/$target_ip/' hosts"
                              sh '''
                              ansible-playbook -vvvvv -i hosts  -e "service=docker jenkins_path=/opt/jenkins user=ubuntu port=8080" --private-key=/var/jenkins_home/.ssh/pr.pem playbook.yml
                              '''
                    }
                     
                  
                }
            }
    }
  }
}
