// for the simplestep 3
stage('Commit') {
    node {
      git url: 'https://github.com/hcguersoy/simplest-example.git'
      def mvnHome = tool 'maven339'
      echo "Directory is: " + pwd()
      sh "${mvnHome}/bin/mvn -B clean verify"
      echo "Finished"  
    }
}