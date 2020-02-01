FROM centos:centos7 as webapp

RUN yum install -y epel-release && \
    yum install -y \
        nginx && \
    yum clean all

# Remove the default Nginx configuration file
RUN rm -v /etc/nginx/nginx.conf
# Copy a configuration file from the current directory
ADD nginx.conf /etc/nginx/

RUN mkdir /var/www
ADD base_index.html /var/www/index.html

#RUN set -x \
## forward request and error logs to docker log collector
#    && ln -sf /dev/stdout /var/log/nginx/access.log \
#    && ln -sf /dev/stderr /var/log/nginx/error.log

# Expose ports
EXPOSE 9980

CMD ["nginx", "-g", "daemon off;"]
