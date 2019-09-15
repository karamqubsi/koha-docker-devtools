FROM debian:8
# ENV APT_KEY_DONT_WARN_ON_DANGEROUS_USAGE=DontWarn

ARG REPO
ARG REPO_KEY
ARG REPO_DISTRIBUTION

RUN apt-get update &&  apt-get upgrade -y && \
   apt-get install -y  wget gnupg2 ca-certificates git build-essential cpanminus 
RUN wget -q -O- $(echo $REPO_KEY)  | apt-key add - 
RUN echo "deb $REPO $REPO_DISTRIBUTION main" | tee /etc/apt/sources.list.d/koha.list
RUN apt-get update
RUN apt-get -y install koha-common
RUN apt-get clean
RUN cpanm Locale::Messages
RUN echo 127.0.0.1 library.localhost library-intra.localhost |  tee -a /etc/hosts
RUN git clone git://github.com/mkfifo/koha-gitify.git
WORKDIR /koha-gitify
RUN chmod +x koha-gitify 
WORKDIR /
COPY ./koha-sites.conf /etc/koha/koha-sites.conf
RUN a2enmod rewrite && a2enmod cgi && service apache2 restart
COPY ./passwd /etc/koha/passwd
RUN koha-create --use-db --database koha --dbhost mariadb --passwdfile /etc/koha/passwd  library
RUN a2dissite 000-default.conf
RUN echo "Listen 8080" >> /etc/apache2/ports.conf
# COPY SIPconfig.xml /etc/koha/sites/library/SIPconfig.xml
COPY ./start.sh /start.sh
# RUN apt-get install -q -y rsyslog 
# RUN apt install nano -y 
# COPY ./instance_bashrc /var/lib/koha/library/.bashrc
# RUN chown library-koha:library-koha  /var/lib/koha/library/.bashrc
EXPOSE  80 8080 6001 8023
# CMD ["/usr/sbin/apache2ctl", "-DFOREGROUND"]
# CMD sh /start.sh
CMD ["/bin/bash", "/start.sh"]
