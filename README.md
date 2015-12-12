Installation Instructions
==================


Dependencies

    java >= 1.7
    mysql >= 5.5
    apache tomcat >= 7
    maven >= 3
    
###Ubuntu 14.04 or higher: 

    # apt-get update
    # sudo apt-get install default-jdk mysql maven
    # cd ~
    # wget apache.ip-connect.vn.ua/tomcat/tomcat-8/v8.0.30/bin/apache-tomcat-8.0.30.tar.gz
    # sudo mkdir /opt/tomcat
    # sudo tar xvf apache-tomcat-8*tar.gz -C /opt/tomcat --strip-components=1

## To start server:
    # Download wimk.war (WimK/target/wimk.war) and copy to /opt/tomcat/webapps/
    # Download db_wimk.sql (Wimk/databases/db_wimk.sql) and use it to create database in mysql
    # Restart tomcat (/opt/tomcat/bin/catalina.sh restart)
    # go to http://localhost:8080/WimK/
    # if nesessary:  
        # configure your mysql access in app.properties file:
        # /opt/tomcat.webapps/wimk/WEB-INF/classes/app.properties
        # and restart tomcat
