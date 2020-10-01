job('a_workspace_build') {
    logRotator {
        numToKeep 20
    }
    steps {
        shell('echo Completed a build!')
    }
    wrappers {
        timestamps()
    }
}

job('b_workspace_build') {
    logRotator {
        numToKeep 20
    }
    steps {
        shell('echo Completed b build!')
    }
    wrappers {
        timestamps()
    }
}

job('c_workspace_build') {
    logRotator {
        numToKeep 20
    }
    steps {
        shell('echo Completed c build!')
    }
    wrappers {
        timestamps()
    }
}
pipelineJob('ReleasePipeline') {
    description("A pipeline created by tracking release materials")
    definition {
        cps {
            script((new File("/var/jenkins_home/seeds/jobs/Jenkinsfile")).text)

        }
    }
}
