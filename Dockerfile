FROM ubuntu

MAINTAINER padharthiswetha@gmail.com

WORKDIR /opt
RUN mkdir /opt/tomcat/
RUN apt-get update
RUN apt-get -y install openjdk-8-jdk wget unzip 


RUN curl -O https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.45/bin/apache-tomcat-9.0.45.zip
RUN unzip apache-tomcat-9.0.45.zip
RUN mv apache-tomcat-9.0.45/* /opt/tomcat/ 
ADD target/*.war /opt/tomcat/webapps/


WORKDIR /opt/tomcat/webapps

EXPOSE 8080

CMD ["sh","/opt/tomcat/bin/catalina.sh", "run"]
