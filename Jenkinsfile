def ls_command
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
                        string defaultValue: 'Host', description: '', name: 'TARGET', trim: false
                    }
                
            steps {
                script {
                    sh "sudo su"
                    sh "ansible-playbook -i "$TARGET," -u ubuntu -b --private-key=my.pem playbook.yaml"
                }
            }
        }
    }
}
