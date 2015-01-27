FROM centos:latest

ADD ./yum.repos.d/nginx.repo /etc/yum.repos.d/nginx.repo
RUN yum install nginx -y && \
    rm -f /etc/nginx/conf.d/default.conf

ADD ./confd/confd /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd && \
    mkdir -p /etc/confd/conf.d && \
    mkdir -p /etc/confd/templates

ADD ./confd/conf.d/myconfig.toml /etc/confd/conf.d/myconfig.toml
ADD ./confd/templates/nginx.tmpl /etc/confd/templates/nginx.tmpl
ADD ./confd/confd.toml /etc/confd/confd.toml

#ADD ./boot.sh /opt/boot.sh
#RUN chmod +x /opt/boot.sh

EXPOSE 80 443

#CMD /opt/boot.sh



