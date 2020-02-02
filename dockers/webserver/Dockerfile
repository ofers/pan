#Stage1 - build index.html
FROM centos:centos7 as mybuild
RUN yum install -y python36 python-pip
RUN mkdir /app
ADD webserver/req.txt /app/req.txt
RUN pip3 install -r /app/req.txt
COPY webserver/sitebuilder /app
RUN cd /app/;python3 buildhtml.py
#CMD ["cd /app/;python3 buildhtml.py"]

#Stage2 - preper webserver with index.html from stage1
FROM centos:centos7 as webserver
RUN yum install -y epel-release && \
    yum install -y \
        nginx && \
    yum clean all
RUN rm -v /etc/nginx/nginx.conf
ADD webserver/nginx.conf /etc/nginx/
RUN mkdir /var/www
COPY --from=mybuild /app/index.html /var/www/index.html
EXPOSE 9980
CMD ["nginx", "-g", "daemon off;"]
