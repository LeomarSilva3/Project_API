pipeline {
    agent {
        docker {
            image "ruby:alpine"
            args "--network=skynet"
            args "localhost:5432"
        }
       
    }
    stages {
        stage("Build") {
            steps {
                sh "chmod +x build/alpine.sh"
                sh "./build/alpine.sh"
                sh "gem install bundler:2.0.2"
                sh "bundle install"
            }
        }
        stage("Testes"){
            steps {
                sh "bundle exec rspec -fd"
            }
        }
    }
}