#!groovy

node {

    try {
        stage 'Checkout'
            checkout scm

            sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
            def lastChanges = readFile('GIT_CHANGES')
            // slackSend color: "warning", message: "Started `${env.JOB_NAME}#${env.BUILD_NUMBER}`\n\n_The changes:_\n${lastChanges}"
         stage('Setup Virtual Environment') {
            steps {
                // Change to the project directory
                script {
                    sh 'cd /path/to/your/project'
                }

                // Activate virtual environment
                script {
                    sh 'source env/bin/activate'
                }
            }
        }

        stage('Install Dependencies') {
            steps {
                // Install requirements
                script {
                    sh 'pip install -r requirement.txt'
                }
            }
        }

        stage('Django Tasks') {
            steps {
                // Django tasks
                script {
                    sh 'python manage.py collectstatic --noinput'
                    sh 'python manage.py makemigrations'
                    sh 'python manage.py migrate'
                }
            }
        }

        stage('Restart Services') {
            steps {
                // Restart services
                script {
                    sh 'sudo systemctl reload nginx'
                    sh 'sudo systemctl daemon-reload'
                    sh 'sudo systemctl restart hospital.gunicorn.service'
                    sh 'sudo systemctl restart nginx'
                }
            }
        }
        
        
    }

    catch (err) {
        // slackSend color: "danger", message: "Build failed :face_with_head_bandage: \n`${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"

        throw err
    }

}