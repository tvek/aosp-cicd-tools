###############################################
#
# Filename : Dockerfile
# Developer : Thomas Vimal Easo K
#
###############################################

FROM jenkins/jenkins:lts

#Configuration
ENV JENKINS_DIR=$(pwd)/out/jenkins_home
ENV JENKINS_LOCAL_CONFIG_DIR=./configs/
ENV JENKINS_ROOT_CONFIG_DIR=/usr/share/jenkins/ref

# Initialization
VOLUME $(JENKINS_DIR)
ENV JAVA_OPTS -Djenkins.install.runSetupWizard=false
COPY $JENKINS_LOCAL_CONFIG_DIR $JENKINS_ROOT_CONFIG_DIR
#RUN cat $JENKINS_ROOT_CONFIG_DIR/init.groovy.d/startup.groovy

# Plugins
COPY plugins.txt $JENKINS_ROOT_CONFIG_DIR/plugins.txt
RUN /usr/local/bin/install-plugins.sh < $JENKINS_ROOT_CONFIG_DIR/plugins.txt


