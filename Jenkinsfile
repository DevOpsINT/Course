import org.codehaus.groovy.control.messages.ExceptionMessage
counter = 1
template_ip = "IP_ADDR_"
hosts_file_name = "hosts"
folder_for_run_playbook = "ansible"
list_of_choices = []
CurrentVersion = 1
def Commit_Id
def Build_version
def NextVersion
def  docker_hub_repo
docker_slave_node = 'docker-host'
script_name = "Experiment.py"
test_script_name = "ExperimentTests.py"
folder_scripts= "scripts"
pipeline_failure_indicator_string = 'FAILURE'
dockerize_string = "dockerize"
module="python3"
base_image_name="python:3"
image_name = "python_image"
docker_hub_repo = 'lidorabo/docker_repo'
docker_file_name = 'Dockerfile'
docker_hub_jenkins_cred_id = 'docker-hub'
string_to_check = "Hello world!"
underscore = '_'
git_cred_id = 'dcacc4ee-0dab-4a7f-b781-ad2b883bfe68'
pipeline {
    options {
        timeout(8)
    }
    agent {
        label 'master'
    }
    stages {
        stage('checkout') {
            steps {
                script {
                        git branch: 'Lidor', credentialsId: 'dcacc4ee-0dab-4a7f-b781-ad2b883bfe68', url: 'https://github.com/DevOpsINT/Course.git'
                        CurrentVersion = sh(script: "git tag | sort -r | head -n 1", returnStdout: true).trim()
                        Commit_Id = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                        Build_version = CurrentVersion + '_' + Commit_Id
                        NextVersion = CurrentVersion + 1
                }
            }
        }
        stage('Input') {
            steps {
                script {
                    show_dir_content_command = "ls ./ansible/roles"
                    change_first_char_word_command = "sed -E \'s/./\\u&/\'"
                    choices = input(
                            id: 'userInput', message: 'Choose options:', ok: 'Ok', cancel: 'Cancel',
                            parameters: [
                                    booleanParam(defaultValue: false, name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                    booleanParam(defaultValue: false, name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                    booleanParam(defaultValue: false, name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                    booleanParam(defaultValue: false, name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim()),
                                    booleanParam(defaultValue: false, name: sh(script: "$show_dir_content_command | awk NR==${counter++} | $change_first_char_word_command", returnStdout: true).trim())

                            ])

                    for (entry in choices) {
                        if (entry.value == true) {
                            list_of_choices.add(entry.key.toLowerCase())
                        }
                    }
                    list_of_choices.sort()
                    dir(folder_for_run_playbook) {

                        sh "cp $hosts_file_name ${hosts_file_name}.bak"
                        for (value in list_of_choices) {
                            def ip = input(
                                    id: 'userInput', message: 'Enter Host info for installing\n ' + value, ok: 'Ok',
                                    parameters: [

                                            string(defaultValue: '192.168.1.3',
                                                    name: 'private_ip'),
                                    ])
                            sh "sed -i 's/\\$template_ip$value\\>/$ip/' $hosts_file_name"
                        }
                    }
                }
            }
        }
        stage('UT'){

            when{
                expression { dockerize_string in list_of_choices }
            }
            steps{
                script{
                    sh "echo Checking the build version: $Build_version"
                    dir("./$folder_scripts"){
                        try {
                            sh "$module $test_script_name"
                        }
                        catch (exception){
                            println "The test is failed"
                            currentBuild.result =  pipeline_failure_indicator_string
                            throw exception
                        }
                    }

                }
            }
        }
        stage('Build docker image'){

            when{
                expression { dockerize_string in list_of_choices }
            }
            steps{
                script{
                    archive_name = 'archive'
                        sh "echo $workspace"
                        dir(workspace){
                            stash includes: "$docker_file_name,**/$folder_scripts/*", name: archive_name
                        }
                    node(docker_slave_node){
                        try{
                             unstash archive_name
                             sh "sudo docker build --build-arg script_name=$script_name --build-arg test_script_name=$test_script_name --build-arg folder_scripts=$folder_scripts --build-arg module=$module --build-arg image_name=$base_image_name . -t $image_name:$Build_version"
                        }
                        catch (exception){
                            println "The image build is failed"
                            currentBuild.result = pipeline_failure_indicator_string
                            throw exception
                        }

                    }
                }
            }
        }
        stage('Testing running image in container'){
            when{
                expression { dockerize_string in list_of_choices }
            }
            steps{
                script{
                    remove_image_command = 'sudo docker rmi -f $(sudo docker images | grep python | awk \'{print $3}\')'
                    error_message_running_container = "The result of running container is incorrect"
                    node(docker_slave_node){
                        try{
                            result = sh(script: "sudo docker run --rm --name $image_name $image_name:$Build_version", returnStdout: true).trim()
                            if (result != string_to_check){
                                sh label: '', script: remove_image_command
                                currentBuild.result = pipeline_failure_indicator_string
                                throw new Exception(error_message_running_container)
                            }
                        }
                        catch (exception){
                            sh label: '', script: remove_image_command
                            currentBuild.result = pipeline_failure_indicator_string
                            throw new Exception(error_message_running_container)
                        }
                    }
                }
            }
        }
        stage('Push image to the Dockerhub'){
            when{
                expression { dockerize_string in list_of_choices }
            }
            steps{
                script{
                    node(docker_slave_node) {
                        try {
                            withCredentials([usernamePassword(credentialsId: docker_hub_jenkins_cred_id, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                                sh "sudo docker login -u=${DOCKER_USERNAME} -p=${DOCKER_PASSWORD}"
                                sh "sudo docker tag $image_name:$Build_version $docker_hub_repo:${image_name + underscore +Build_version}"
                                sh "sudo docker push $docker_hub_repo:${image_name + underscore + Build_version}"
                                sh(script: "$remove_image_command")

                            }
                        }
                        catch (exception){
                            println "The image upload is failed"
                            sh(script: "$remove_image_command")
                            currentBuild.result = pipeline_failure_indicator_string
                            throw exception
                        }

                    }
                }
            }
        }
        stage('Running playbook') {

            when{
                expression {  list_of_choices.size() > 0 }
            }
            steps {
                script {
                    dir(folder_for_run_playbook) {
                        ansiColor('xterm') {
                            withCredentials([usernamePassword(credentialsId: docker_hub_jenkins_cred_id, passwordVariable: 'DOCKER_PASSWORD', usernameVariable: 'DOCKER_USERNAME')]) {
                                ansiblePlaybook(
                                        colorized: true,
                                        credentialsId: '/var/jenkins_home/.ssh/id_rsa',
                                        inventory: hosts_file_name,
                                        extraVars: [
                                                image_name     : "$docker_hub_repo:${image_name + underscore + Build_version}",
                                                string_to_check: "$string_to_check",
                                                docker_username: "$DOCKER_USERNAME",
                                                docker_password: "$DOCKER_PASSWORD"
                                        ],
                                        extras: """-e '{"choices":$list_of_choices}'"""
                                        , playbook: 'main.yml',

                                )
                            }
                        }
                        sh "mv ${hosts_file_name}.bak $hosts_file_name "
                    }

                }
            }
        }
        stage('Push tag to the repository'){
            when{
                expression { dockerize_string in list_of_choices }
            }
            steps{
                script{
                    withCredentials([usernamePassword(credentialsId: git_cred_id , passwordVariable: 'GIT_PASSWORD', usernameVariable: 'GIT_USERNAME')]) {
                        try{
                            sh """
                         git config --global user.name "LidorAbo"
                         git config --global user.email "Lidorabo2@gmail.com"
                         git tag -a $NextVersion -m "Tag for release version of python module"
                         git push  https://${GIT_USERNAME}:${GIT_PASSWORD}@github.com/DevOpsINT/Course.git $NextVersion
                            """
                        }
                        catch (exception){
                            println "Pushing tag to git is failed"
                            currentBuild.result = pipeline_failure_indicator_string
                            throw exception
                        }

                    }
                }
            }
        }
        stage('Cleanup') {
            steps {
                deleteDir()
            }

        }
    }
}