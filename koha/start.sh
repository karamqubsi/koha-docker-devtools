 ./koha-gitify/koha-gitify library /Koha
service apache2 stop
service rsyslog start
koha-start-sip library
/usr/sbin/apache2ctl -DFOREGROUND