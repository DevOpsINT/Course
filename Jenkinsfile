pipeline {
    agent {
        label 'master'
    }
    stages {
        stage('checkout'){
            steps {
                script {
                    git credentialsId: 'devopint', url: 'https://github.com/DevOpsINT/Course.git'
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
                    sh "cd /etc/ansible"
                    sh "echo $HOST >> hosts"
                    sh "ansible-playbook -i hosts  -u root -b --private-key=./ssh/id_rsa /var/jenkins_home/playbook.yaml"
                    
                }
            }
        }
    }
}
