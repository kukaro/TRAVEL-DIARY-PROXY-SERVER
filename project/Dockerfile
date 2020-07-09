FROM ubuntu:latest
MAINTAINER kukaro <justkukaro@naver.com>
RUN apt-get update

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
RUN touch ~/.vimrc
RUN echo "set nu\n" >> ~/.vimrc
RUN a2enmod rewrite

EXPOSE 22 80 8080

CMD ["/usr/sbin/sshd", "-D"]
