FROM tomcat:latest

RUN cp -R  /usr/local/tomcat/webapps.dist/*  /usr/local/tomcat/webapps

COPY target/*.war /usr/local/tomcat/webapps

EXPOSE 8080

CMD chmod +x /usr/local/tomcat/bin/catalina.sh

CMD ["catalina.sh", "run"]
