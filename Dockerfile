FROM frolvlad/alpine-glibc

MAINTAINER nuaays@gmail.com

ADD localtime /etc/localtime

ADD apache-tomcat-8.5.5 /opt/tomcat8

ADD jre /opt/tomcat8/jre

ENV JAVA_HOME /opt/tomcat8/jre

ENV PATH $PATH:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:$JAVA_HOME/bin

ENV JAVA_OPTS $JAVA_OPTS -Duser.timezone=GMT+08

#RUN apk --update add wget ca-certificates && \
    #export ALPINE_GLIBC_BASE_URL="https://circle-artifacts.com/gh/andyshinn/alpine-pkg-glibc/6/artifacts/0/home/ubuntu/alpine-pkg-glibc/packages/x86_64" && \
    #export ALPINE_GLIBC_PACKAGE="glibc-2.21-r2.apk" && \
    #export ALPINE_GLIBC_BIN_PACKAGE="glibc-bin-2.21-r2.apk" && \
    #wget --no-check-certificate "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BASE_URL/$ALPINE_GLIBC_BIN_PACKAGE" && \
    #apk add --allow-untrusted "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" && \
    #/usr/glibc/usr/bin/ldconfig "/lib" "/usr/glibc/usr/lib" && \
    #echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' >> /etc/nsswitch.conf && \
    #apk del wget ca-certificates && \
    #rm "$ALPINE_GLIBC_PACKAGE" "$ALPINE_GLIBC_BIN_PACKAGE" /var/cache/apk/* && \
RUN echo "Asia/Shanghai" > /etc/timezone && ln -sv /opt/tomcat8/webapps/docs /opt/tomcat8/logs

EXPOSE 8080

WORKDIR /opt/tomcat8/bin

CMD ["sh","catalina.sh","run"]
