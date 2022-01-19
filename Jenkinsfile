pipeline {

    agent {
            any {
                image 'maven:3.8.1-adoptopenjdk-11'
                args '-v /root/.m2:/root/.m2'
            }
        }

    stages {

        stage('Build') {
            steps {
                sh "mvn clean compile"
            }
        }

        stage('Test') {
            steps {
                sh "mvn test"
            }
        }

        stage('Deploy') {
            steps {
                sh "mvn clean heroku:deploy"
            }
        }

    }

}

