FROM tomcat:8.5
MAINTAINER Nitish Tiwari <nitish.tiwari@tothenew.com>

RUN apt-get update
RUN apt-get install -y \
    net-tools \
    tree \
    vim

RUN apt-get clean
RUN echo "export JAVA_OPTS=\"-Dapp.env=staging\"" > /usr/local/tomcat/bin/setenv.sh
COPY target/wwp-1.0.0.war /usr/local/tomcat/webapps/wwp-1.0.0.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

