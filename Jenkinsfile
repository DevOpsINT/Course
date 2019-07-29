pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                cleanWs()
                script {
                    git credentialsId: 'devopint', url: 'https://github.com/DevOpsINT/Course'
                }
            }
        }
        stage('Ansible Playbook') {
            steps {
                dir ('ansible'){
                script { 
                targetIP = input(
                            id: 'userInput', message: 'ip add',
                            parameters: [
                                string(defaultValue: '0.0.0.0',
                                       description: 'ip address',
                                       name: 'IP')])
                    
                    sh "sed -i 's/HOST_IP/${targetIP}/g' hosts"
                    sh "ansible-playbook -i hosts  -u ubuntu -b --private-key=/var/jenkins_home/ansible/yoskey.pem main.yml"
                    sh 'cat hosts'
                    sh "ansible-playbook -i hosts  -u ubuntu -b --private-key=/var/jenkins_home/ansible/my.pem playbook.yml"
                    
                }
            }
        
        }
    }
}
}


