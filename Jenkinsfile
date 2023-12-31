// #!groovy

// node {

//     try {
//         stage 'Checkout'
//             checkout scm

//             sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
//             def lastChanges = readFile('GIT_CHANGES')
//             // slackSend color: "warning", message: "Started `${env.JOB_NAME}#${env.BUILD_NUMBER}`\n\n_The changes:_\n${lastChanges}"
//          stage('Setup Virtual Environment') {
//             steps {
//                 // Change to the project directory
//                 script {
//                     sh 'cd /path/to/your/project'
//                 }

//                 // Activate virtual environment
//                 script {
//                     sh 'source env/bin/activate'
//                 }
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 // Install requirements
//                 script {
//                     sh 'pip install -r requirement.txt'
//                 }
//             }
//         }

//         stage('Django Tasks') {
//             steps {
//                 // Django tasks
//                 script {
//                     sh 'python manage.py collectstatic --noinput'
//                     sh 'python manage.py makemigrations'
//                     sh 'python manage.py migrate'
//                 }
//             }
//         }

//         stage('Restart Services') {
//             steps {
//                 // Restart services
//                 script {
//                     sh 'sudo systemctl reload nginx'
//                     sh 'sudo systemctl daemon-reload'
//                     sh 'sudo systemctl restart hospital.gunicorn.service'
//                     sh 'sudo systemctl restart nginx'
//                 }
//             }
//         }
        
        
//     }

//     catch (err) {
//         // slackSend color: "danger", message: "Build failed :face_with_head_bandage: \n`${env.JOB_NAME}#${env.BUILD_NUMBER}` <${env.BUILD_URL}|Open in Jenkins>"

//         throw err
//     }

// }
// node {
//     try {
//         stage 'Checkout'
//         checkout scm

//         sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
//         def lastChanges = readFile('GIT_CHANGES')
//         echo "Changes: \n${lastChanges}"

//         stage('Setup Virtual Environment') {
//             steps {
//                 script {
//                     echo "Changing to the project directory"
//                     sh 'pwd'
                    
//                 }

//                 script {
//                     echo "Activating virtual environment"
//                     sh 'source env/bin/activate'
//                 }
//             }
//         }

//         stage('Install Dependencies') {
//             steps {
//                 script {
//                     echo "Installing requirements"
//                     sh 'pip install -r requirement.txt'
//                 }
//             }
//         }

//         stage('Django Tasks') {
//             steps {
//                 script {
//                     echo "Running Django tasks"
//                     sh 'python manage.py collectstatic --noinput'
//                     sh 'python manage.py makemigrations'
//                     sh 'python manage.py migrate'
//                 }
//             }
//         }

//         stage('Restart Services') {
//             steps {
//                 script {
//                     echo "Restarting services"
//                     sh 'sudo systemctl reload nginx'
//                     sh 'sudo systemctl daemon-reload'
//                     sh 'sudo systemctl restart hospital.gunicorn.service'
//                     sh 'sudo systemctl restart nginx'
//                 }
//             }
//         }
//     } catch (err) {
//         echo "Error occurred: ${err.message}"
//         throw err
//     }
// }





node {
    try {
        stage('Checkout') {
            checkout scm
            sh 'git log HEAD^..HEAD --pretty="%h %an - %s" > GIT_CHANGES'
            def lastChanges = readFile('GIT_CHANGES')
        }

        stage('Deploy') {
            sh './deployment/deploy_prod.sh'
        }
    } catch (err) {
        throw err
    }
}

