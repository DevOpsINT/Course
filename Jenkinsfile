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
                    sh "cd /&& cd /var/jenkins_home/ansible&& ls"
                    sh "ansible-playbook -i $HOST,  -u ubuntu -b --private-key=/var/jenkins_home/ansible/my.pem /var/jenkins_home/ansible/playbook.yaml"
                }
            }
        }
    }
}
