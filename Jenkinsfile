@Library('jenkins-shared') _

pipeline {
  options {
    buildDiscarder(logRotator(numToKeepStr: '30', artifactNumToKeepStr: '30'))
  }

  environment {
      QT5_PKG = 'qt5.tar.gz'
  }

  agent { label 'general' }

  parameters {
    booleanParam(name: 'DEBUG_BUILD', defaultValue: false, description: 'Check this if you want to enter debug mode (sleep)')
    string(name: 'SLEEP_TIME', defaultValue: '14400', description: 'Sleep time in seconds')
  }

  stages {
    stage("Prebuild") {
      steps {
        sh 'ci/prebuild.sh'
      }
    }
    stage("Build") {
      steps {
        sh 'ci/build.sh'
      }
    }
    stage("Prepare") {
      steps {
	sh 'make install'
        sh 'tar -czvf qt5.tar.gz $WORKSPACE/../qt5'
      }
    }
    stage("S3-upload") {
      steps {
        s3Upload(file: QT5_PKG, bucket: 'nsof-qt5', path: 'builds/' + env.GIT_COMMIT + '/' + QT5_PKG)
        s3Upload(file: QT5_PKG, bucket: 'nsof-qt5', path: 'branches/' + env.BRANCH_NAME + '/' + QT5_PKG)
      }
    }
  }

  post {
    always {
      sendNotifications currentBuild.result
      debugBuild(params.DEBUG_BUILD, params.SLEEP_TIME)
    }
  }
}
