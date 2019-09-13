pipeline {
    agent {
        docker {
            image "ruby"       
            
        }
       
    }
    stages {
        stage("Build") {
            steps {
                sh "chmod +x /etc/rc.d/rc.postgresql"
                sh "/etc/rc.d/rc.postgresql start"
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