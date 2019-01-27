FROM tomcat

MAINTAINER Sunil <sunilngvli@gmail.com>

RUN apt-get update && apt-get -y upgrade

WORKDIR /usr/local/tomcat

COPY tomcat-users.xml /usr/local/tomcat/conf/tomcat-users.xml
COPY context.xml /usr/local/tomcat/webapps/manager/META-INF/context.xml

COPY target/hello-world.war /usr/local/tomcat/webapps/hello-world.war

CMD ["echo","tomcat with hello-world app initialized on `date`"]

EXPOSE 8080
