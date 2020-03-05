pipeline {
    agent { label 'docker' }
    options { disableConcurrentBuilds() }
    environment {
        CUR_PROJ = 'mariadb_monitor' // github repo name
        CUR_PKG = 'INWTdbMonitor' // r-package name
        CUR_PKG_FOLDER = '.' // defaults to root
        INWT_REPO = 'inwt-vmdocker1.inwt.de:8081'
    }
    stages {
        stage('Testing with R') {
            agent { label 'test' }
            when { not { branch 'depl' } }
            environment {
                TMP_SUFFIX = """${sh(returnStdout: true, script: 'echo `cat /dev/urandom | tr -dc \'a-z\' | fold -w 6 | head -n 1`')}"""
                CREDENTIALS = credentials('maria-db-monitor-config')
            }
            steps {
                sh '''
                mkdir -p .INWTdbMonitor
                cp -f $CREDENTIALS .INWTdbMonitor/cnf.file
                docker build --pull -t tmp-$CUR_PROJ-$TMP_SUFFIX .
                docker run --rm --network host tmp-$CUR_PROJ-$TMP_SUFFIX R CMD check --no-manual .
                docker run --rm --network host -v $PWD/covr:/app/covr tmp-$CUR_PROJ-$TMP_SUFFIX Rscript -e "res <- covr::package_coverage(); covr::to_cobertura(res, filename = 'covr/coverage.xml')"
                docker rmi tmp-$CUR_PROJ-$TMP_SUFFIX
                rm -f .INWTdbMonitor/cnf.file
                '''
            }
        }
        stage('Deploy R-package') {
            agent { label 'eh2' }
            when { branch 'master' }
            steps {
                sh '''
                rm -vf *.tar.gz
                docker pull inwt/r-batch:latest
                docker run --rm --network host -v $PWD:/app --user `id -u`:`id -g` inwt/r-batch:latest R CMD build $CUR_PKG_FOLDER
                PKG_VERSION=`grep -E '^Version:[ \t]*[0-9.]{3,10}' $CUR_PKG_FOLDER/DESCRIPTION | awk '{print $2}'`
                PKG_FILE="${CUR_PKG}_${PKG_VERSION}.tar.gz"
                docker run --rm -v $PWD:/app -v /var/www/html/r-repo:/var/www/html/r-repo inwt/r-batch:latest R -e "drat::insertPackage('$PKG_FILE', '/var/www/html/r-repo'); drat::archivePackages(repopath = '/var/www/html/r-repo')"
                '''
            }
        }
        
        stage('Deploy Docker-image') {
            agent { label 'docker' }
            when  { branch 'master' }
            environment {
                CREDENTIALS = credentials('maria-db-monitor-config')
            }
            steps {
                sh '''
                mkdir -p .INWTdbMonitor
                cp -f $CREDENTIALS .INWTdbMonitor/cnf.file
                docker build --pull -t $INWT_REPO/$CUR_PROJ:latest .
                docker push $INWT_REPO/$CUR_PROJ:latest
                docker rmi $INWT_REPO/$CUR_PROJ:latest
                rm -f .INWTdbMonitor/cnf.file
                '''
            }
        }
    }
    post {
        always {
            step([$class: 'CoberturaPublisher',
                  autoUpdateHealth: false,
                  autoUpdateStability: false,
                  coberturaReportFile: 'covr/coverage.xml',
                  failNoReports: false,
                  failUnhealthy: false,
                  failUnstable: false,
                  maxNumberOfBuilds: 10,
                  onlyStable: false,
                  sourceEncoding: 'ASCII',
                  zoomCoverageChart: false])
         }
    }
}
