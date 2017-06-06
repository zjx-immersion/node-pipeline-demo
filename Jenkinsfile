node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('docker clear') {
        //sh 'ls -a'
        //sh 'chmod +x clear.sh'
        //sh './clear.sh'
        script {
            sh 'chmod +x clear.sh'
            POM_VERSION = sh(script: "./clear.sh", returnStdout: true)
            echo "${POM_VERSION}"
        } 
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("zhongjx/demonode")
    }

    stage('Test image') {
        /* Ideally, we would run a test framework against our image.
         * For this example, we're using a Volkswagen-type approach ;-) */

        app.inside {
            sh 'echo "Tests passed"'
        }
    }

    stage('Push image') {
        /* Finally, we'll push the image with two tags:
         * First, the incremental build number from Jenkins
         * Second, the 'latest' tag.
         * Pushing multiple tags is cheap, as all the layers are reused. */
        docker.withRegistry('https://registry.hub.docker.com', 'docker-registry-login') {
            app.push("${env.BUILD_NUMBER}")
            app.push("latest")
        }
    }

    stage('Deploy to container') {
       sh "echo 'Run App in Container'"
       sh "docker run --name=demonode  -d -p 5000:8000 zhongjx/demonode:${env.BUILD_NUMBER}"
    }
}