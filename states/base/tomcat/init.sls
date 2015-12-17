java-1.6.0-openjdk:
  pkg:
    - installed

java-1.6.0-openjdk-demo:
  pkg:
    - installed

java-1.6.0-openjdk-devel:
  pkg:
    - installed

java-1.6.0-openjdk-javadoc:
  pkg:
    - installed

java-1.6.0-openjdk-src:
  pkg:
    - installed

tomcat:
  pkg:
    - installed
  service.running:
    - enable: True
    - watch:
      - pkg: tomcat
      - file: /etc/tomcat/server.xml
      - file: /etc/tomcat/web.xml
      - file: /etc/tomcat/tomcat-users.xml
      - file: /var/lib/tomcat/webapps/examples/WEB-INF/web.xml

tomcat-admin-webapps:
  pkg:
    - installed

tomcat-docs-webapp:
  pkg:
    - installed

tomcat-el-2.2-api:
  pkg:
    - installed

tomcat-javadoc:
  pkg:
    - installed

tomcat-jsp-2.2-api:
  pkg:
    - installed

tomcat-jsvc:
  pkg:
    - installed

tomcat-lib:
  pkg:
    - installed

tomcat-servlet-3.0-api:
  pkg:
    - installed

tomcat-webapps:
  pkg:
    - installed


/etc/tomcat/server.xml:
  file:
    - managed
    - source: salt://tomcat/server.xml
    - user: tomcat
    - group: tomcat
    - mode: 664

/var/lib/tomcat/webapps/examples/WEB-INF/web.xml:
  file:
    - managed
    - source: salt://tomcat/web.xml
    - user: tomcat
    - group: tomcat
    - mode: 664

/etc/tomcat/tomcat-users.xml:
  file:
    - managed
    - source: salt://tomcat/tomcat-users.xml
    - user: tomcat
    - group: tomcat
    - mode: 664


/var/lib/tomcat/webapps/examples/WEB-INF/classes/SessionExample.class:
  file:
    - managed
    - source: salt://tomcat/SessionExample.class
    - user: tomcat
    - group: tomcat
    - mode: 664

/usr/share/tomcat/webapps/examples/jsp/session.jsp:
  file:
    - managed
    - source: salt://tomcat/session.jsp
    - user: tomcat
    - group: tomcat
    - mode: 664

/usr/share/tomcat/webapps/examples/jsp/play_from_cdn.html:
  file:
    - managed
    - source: salt://tomcat/play_from_cdn.html
    - user: tomcat
    - group: tomcat
    - mode: 664
