pipeline {
    agent any
    stages {
        stage('Clone repository') {
            checkout scm
        }
        stage("Compile") {
            steps {
                sh "./gradlew compileJava"
            }
        }
        stage("Unit test") {
            steps {
                sh "./gradlew test"
            }
        }
        stage("Package") {
            steps {
                sh "./gradlew build"
            }
        }
        stage("Docker build") {
            steps {
                sh "docker build -t sschiavottiello/testcicd ."
            }
        }
        /*stage("Docker push") {
            steps {
                sh "docker login -u username -p password"
                sh "docker push nikhilnidhi/calculator_1"
            }
        }*/
        stage("Deploy to staging") {
            steps {
                sh "docker run -d --rm --name testcicd sschiavottiello/testcicd"
            }
        }
        /*stage("Acceptance test") {
            steps {
                sleep 60
                sh "./acceptance_test.sh"
            }
        }*/
    }
    /*post {
        always {
            sh "docker stop calculator_1"
        }
    }*/
}