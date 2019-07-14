pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                script {
                    cleanWs()
                    git credentialsId: 'devopint', url: 'https://github.com/DevOpsINT/Course.git'
                    sh 'ls'
                }
            }
        }
        stage('Ansible Playbook') {
             input{
                message 'Enter Host'
                    id 'Host'
                    ok 'OK'
                    parameters {
                        string defaultValue: 'Host', description: '', name: 'HOST', trim: false
                    }
             }
                
            steps {
                dir('ansible') {
         script {
           def targetIP = input(
                            id: 'userInput', message: 'Please provide IP address',
                            parameters: [string(defaultValue: 'None', description: 'ip address of the remote host')]
          sh "sed -i 's/IP_ADDRESS/${targetIP}/g' hosts"
          sh "ansible-playbook -i hosts playbook.yml"
                script {
                    sh "cd /&& cd /var/jenkins_home/ansible&& ls"
                    sh "echo $HOST >> hosts"
                    sh "ansible-playbook -i hosts  -u ubuntu -b --private-key=/var/jenkins_home/ansible/my.pem /var/jenkins_home/ansible/playbook.yaml"
                    sh 'rm hosts'
                }
            }
        }
    }
}
