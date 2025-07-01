FROM tomcat:9
ADD /Users/gopinath/.jenkins/workspace/myapp/target/addressbook.war /usr/local/tomcat/webapps
CMD ["catalina.sh", "run"]
EXPOSE 8080
