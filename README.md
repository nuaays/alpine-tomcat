# alpine-tomcat

1. base on alpine-linux
2. with java8 and tomcat8
3. timezone is UTC+8
4. it is very small

##Use case
```
docker run -d -p 8080:8080 -v app.war:/opt/tomcat8/webapps/app.war nuaays/alpine-tomcat
```

> if u want to write it into dockerfile


```
FROM nuaays/alpine-tomcat

ADD app.war/opt/tomcat8/webapps/

CMD ["sh","/opt/tomcat8/bin/catalina.sh","run"]

```

Ths all
