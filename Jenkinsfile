pipeline {
    agent any
    environment {
        M2_HOME='/opt/apache-maven-3.6.0'
    }
    stages {
        stage('checkout code') {
            steps {
                //git branch:"master",credentialsId:"084a65ed-4de5-42a1-87ea-8391e766fc22", url: "https://github.com/sunilnagavelli/helloworld.git"
                checkout scm
            }
        }
        stage('Env setup'){
            steps{
                script {
                    sh '''
                        if [ -z `mvn --version 2>/dev/null`  ]; then
                            whoami && pwd
                            wget --quiet http://mirrors.estointernet.in/apache/maven/maven-3/3.6.0/binaries/apache-maven-3.6.0-bin.zip
                            unzip apache-maven-3.6.0-bin.zip -d /opt >/dev/null
                            echo "Maven Path: `ls -d /opt/apache-maven-3.6.0/bin`"
                            export PATH=$PATH:/opt/apache-maven-3.6.0/bin
                            rm apache-maven-3.6.0-bin.zip
                        else
                            echo "mvn exists already"
                            $M2_HOME/bin/mvn --version
                        fi
                    '''
                }
            }
        }
        stage('maven compile') {
            steps {
                script {
                    sh "$M2_HOME/bin/mvn compile"
                }
            }
        }
        stage('maven package') {
            steps {
                script {
                    sh '''
                        $M2_HOME/bin/mvn package
                        ls -lhtr target/
                    '''
                }
            }
        }
    }
    post {
        always {
            echo 'Job execution completed'
            deleteDir() /* clean up our workspace */
        }
        success {
            echo 'Job status: Success'
        }
        unstable {
            echo 'Job status: Unstable'
        }
        failure {
            echo 'Job status: failed'
        }
        changed {
            echo 'Job changes'
        }
    }
}
