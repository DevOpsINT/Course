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
                script {
                    sh "cd /&& cd /var/jenkins_home/ansible&& ls"
                    sh "echo $HOST >> hosts"
                    sh "ansible-playbook -i hosts  -u ubuntu -b --private-key=~/.ssh.id_rsa /var/jenkins_home/ansible/Playbook.yml"
                    sh 'rm hosts'
                }
            }
        }
    }
}
