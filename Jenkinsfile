pipeline{
  agent{
    label 'Slave node'
  }
  stages{
    stage('clone the repo'){
      steps{
        git url: 'https://github.com/Jaikrishna-M/mock-test.git', branch: 'master' // Update with your repo details
      }
    }
    stage('run the script'){
      steps{
        sh './sample.sh' 
      }
    }
  }
  post {
        success {
            echo "Web servers installed successfully on slave node."
        }
        failure {
            echo "Installation failed."
        }
    }
}
