node {
    
    stage("git clone"){
        git branch: 'main', credentialsId: 'git-jenkins', url: 'git@github.com:SB-A/project_dev_pipeline.git'
    }    
    stage("maven build"){
        def mavenHome = tool name: "maven_3.6.3", type: "maven"
        def mavenCMD = "${mavenHome}/bin/mvn"
        sh "${mavenCMD} clean package"
    }    
    stage("Docker build"){
        sh 'docker build -t maroderik/project_dev:1.0.0 .'
    }
    
    stage("Docker push DockerHub"){
        withCredentials([string(credentialsId: 'DockerHubpwd', variable: 'DockerHubpwd')]) {
           sh "docker login -u maroderik -p ${DockerHubpwd}"
        }
        sh 'docker push maroderik/project_dev:1.0.0'
    }
    stage("Docker run"){
        def dockerRUN = 'docker run -d -p 8081:8080 --name project_dev --rm maroderik/project_dev:1.0.0'
        sshagent(['check_03_user_docker']) {
           sh "ssh -o StrictHostKeyChecking=no docker@192.168.0.70 ${dockerRUN}"
  } 
 }     
}    
   
  
    
