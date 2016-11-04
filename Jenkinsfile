// for the simplestep 4
stage('Commit') {
    docker.image('maven:3.3.3-jdk-8').inside("--volume ${LOCAL_M2_REPO}:/root/.m2") {
      git url: 'https://github.com/hcguersoy/simplest-example.git'
      def mvnHome = tool 'maven339'
      echo "Directory is: " + pwd()
      sh "${mvnHome}/bin/mvn -B clean verify"
      echo "Finished"  
    }
}