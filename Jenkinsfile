counter = 1
template_ip = "IP_ADDR_"
hosts_file_name = "hosts"
folder_for_run_playbook = "ansible"
list_of_choices = []
pipeline{
    options {
  timeout(8)
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
        stage('Input'){
            steps{
                script{
                    show_dir_content_command = "ls ./ansible/roles"
                    change_first_char_word_command = "sed -E \'s/./\\u&/\'"
                    choices = input(
                         id: 'userInput', message: 'Choose options:', ok: 'Ok', cancel: 'Cancel',
                            parameters: [
                                  booleanParam(defaultValue: false, name: sh(script:  "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                  booleanParam(defaultValue: false , name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                  booleanParam(defaultValue: false , name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                  booleanParam(defaultValue: false , name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim())

                            ])
        
                    for (entry in choices) {
                            if(entry.value == true){
                                list_of_choices.add(entry.key.toLowerCase())
                            }
                    }
                    list_of_choices.sort()
                    dir(folder_for_run_playbook){
                        sh "cp $hosts_file_name ${hosts_file_name}.bak"
                         for (value in list_of_choices){
                            def ip = input(
                         id: 'userInput', message: 'Enter Host info for installing\n ' + value, ok: 'Ok',
                            parameters: [

                                    string(defaultValue: '192.168.1.3',
                                            name: 'private_ip'),
                            ])
                            sh "sed -i 's/$template_ip$value/$ip/' $hosts_file_name"
                    }
                    }
                }
          }
        }
            stage(folder_for_run_playbook){
                steps{
                    script{
                    dir(folder_for_run_playbook){
                         ansiColor('xterm'){ 
                          ansiblePlaybook(
                                  credentialsId: '/var/jenkins_home/.ssh/id_rsa', 
                                  inventory: 'hosts', 
                                  extraVars: [
                                      choices: "$list_of_choices"
                                      ]
                                  , playbook:'main.yml',
                                  colorized: true
                                  )
                    }
                    sh "mv ${hosts_file_name}.bak $hosts_file_name "
                    }
                     
                }
            }
        }
        stage('Cleanup'){
            steps{
                    deleteDir()
            }
           
        }
    }
}
