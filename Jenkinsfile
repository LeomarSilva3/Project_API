pipeline {
    agent {
        docker {
            image "ruby:alpine"
            image "rbenv:alpine"
            args "--network=skynet"
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
            post {
                always {
                    cucumber fileIncludePattern: '**/*.json', jsonReportDirectory: 'log', sortingMethod: 'ALPHABETICAL'
                }
            }
        }
    }
}