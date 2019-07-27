pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                script {
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
                    sh "cd /&& cd /etc/ansible&& ls"
                    sh "echo $HOST >> hosts"
                    sh "ansible-playbook -i hosts  -u ubunto -b --private-key=/opt/jenkins_home/ansible/ansible_jenkins.pem /opt/jenkins_home/ansible/Playbook.yml"
                    sh 'rm hosts'
                }
            }
        }
    }
}
