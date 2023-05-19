FROM jenkins/jenkins:latest
ENV JAVA_OPTS "-Djenkins.install.runSetupWizard=false -Dpermissive-script-security.enabled=true"
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
COPY ./job_dsl.groovy ./job_dsl.groovy
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
RUN for f in /usr/share/jenkins/ref/plugins/*.jpi; do mv $f $f.override ; done