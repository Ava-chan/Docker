# use our prepared Raspberry Pi compatible Docker base image with Node.js
FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install -y apache2
RUN apt-get install -y nodejs-legacy

# make the src folder available in the docker image
ADD src/ /src
WORKDIR /src

COPY /src/index.html /var/www/html

# make port 80 available outside of the image
EXPOSE 80

# COPY httpd-foreground /usr/local/bin/ 
# RUN chmod 755 /usr/local/bin/httpd-foreground 

# start node with the index.js file of our hello-world application
# CMD ["httpd-foreground"]
CMD ["/usr/sbin/apachectl","-D","FOREGROUND"]
