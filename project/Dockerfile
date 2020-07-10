FROM ubuntu:latest
MAINTAINER kukaro <justkukaro@naver.com>
RUN apt-get update
RUN apt-get install -y openssh-server
RUN mkdir /var/run/sshd

#set password
RUN echo 'root:root' |chpasswd

#replace sshd_config
RUN sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config

#make .ssh
RUN mkdir /root/.ssh

RUN apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#install git, vim
RUN apt-get update && apt-get install -y git
RUN apt-get install -y vim

#install nodejs
RUN apt-get install -y nodejs
RUN apt-get install -y npm
RUN apt-get install -y curl

#install apache and php
ENV TZ=Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get -y install apache2
RUN apt-get -y install zip
RUN apt-get -y install tree
RUN apt-get -y install mysql-server
RUN apt-get update && apt-get -y install net-tools
RUN apt-get -y install iputils-ping

#set file
ADD ./script /root/script/
ADD ./000-default.conf /etc/apache2/sites-available/
RUN touch ~/.vimrc
RUN echo "set nu\n" >> ~/.vimrc
RUN a2enmod proxy
RUN a2enmod proxy_http
RUN a2enmod proxy_balancer
RUN a2enmod lbmethod_byrequests

#add host
RUN chmod -R 777 /etc/hosts
EXPOSE 22 80 8080

CMD ["/usr/sbin/sshd", "-D"]
