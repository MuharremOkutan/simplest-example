// for the simplestep 5
def localM2 = params.LOCAL_M2_REPO

stage('Commit') {
    echo "Used local m2 repo is ${localM2}"
    docker.image('maven:3.3.3-jdk-8').inside("--volume ${localM2}:/root/.m2") {
      git url: 'https://github.com/hcguersoy/simplest-example.git'
      def mvnHome = tool 'maven339'
      echo "Directory is: " + pwd()
      sh "${mvnHome}/bin/mvn -B clean verify"
      echo "Finished"  
    }
}

def simpleImage
stage('Bakery') {
    simpleImage = docker.build("simpleproject:${env.BUILD_TAG}",".")
    echo "Done Building image with tag ${env.BUILD_TAG}"
}

def simpleContainer
stage('Start DEV') {
    simpleImage.run("-p :8080 --name sc${env.BUILD_TAG}")
    echo "Done Running image with tag ${env.BUILD_TAG}"
}

input "Ready to deprovision?"

stage('Deprovision') {
    node {
        sh "docker rm -fv sc${env.BUILD_TAG}"
        echo "Done stopping container."
    }
}

echo "Finished!"