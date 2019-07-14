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
		stage('files example') {
            steps {
                script {
                    script{
                    line_arr = sh(
                        script: 'ls -lah', returnStdout: true
                        ).split('\n')
                        for(int i = 0; i <  line_arr.size(); i++)
                        sh "echo ${ line_arr[i]} >> outputfile"
                        sh "cat outputfile"
						
						}
					}
				}
			}
             stage('github  actions'){
            steps{
              withCredentials([usernamePassword(credentialsId: 'devopint', passwordVariable: 'Password', usernameVariable: 'Username')]) {
              sh '''
                git config --global user.name "DevOpsInt"
                git config --global user.email "devopsint@gmail.com"
                git pull origin master
                git checkout Alon
                git add outputfile
                git commit -m " Added new file within Jenkins file and push it to the repository"
                git push  https://${Username}:${Password}@github.com/DevOpsINT/Course.git 
                 
				 '''
                     }
                    }
                   }
                }
            }
 