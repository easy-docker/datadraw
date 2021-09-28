FROM ghostry/php:7.2-apache

ENV HOSTNAME 172.17.0.1
ENV DATABASE datadraw
ENV USERNAME datadraw
ENV PASSWORD datadraw
ENV HOSTPORT 3306

RUN rm -rf /var/www/html

COPY datadraw /var/www/html
COPY mysql.sql /var/www/
COPY start.sh /start.sh

RUN chmod +x /start.sh

CMD ["/start.sh"]
