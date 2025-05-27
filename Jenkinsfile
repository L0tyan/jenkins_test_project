pipeline {
    agent any
    
    parameters {
        choice(name: 'ENV', choices: ['dev', 'prod'], description: 'Select environment')
    }
    
    stages {
        stage('Deploy') {
            steps {
                echo "Deploying to ${params.ENV}"
                
                // Очистка рабочей директории
                cleanWs()
                
                // Копирование файлов через SSH (нужен настроенный Publish Over SSH)
                sshPublisher(
                    publishers: [
                        sshPublisherDesc(
                            configName: 'your-ssh-server',
                            transfers: [
                                sshTransfer(
                                    sourceFiles: '**/*',
                                    removePrefix: '',
                                    remoteDirectory: "${params.ENV}",
                                    execCommand: "echo Files copied to ${params.ENV} environment"
                                )
                            ]
                        )
                    ]
                )
            }
        }
    }
}
