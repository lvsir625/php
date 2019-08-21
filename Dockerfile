FROM   172.16.1.170/crm/php-fpm:5.6 
ENV LANG C.UTF-8
RUN mkdir /pecl/
COPY redis-4.3.0.tgz   /pecl/
RUN ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime \
    && echo "Asia/Shanghai" >> /etc/timezone \
    && pecl install /pecl/redis-4.3.0.tgz  \
    && docker-php-ext-enable redis \
    && rm -rf /var/cache/apt/* \
    && rm -rf /var/lib/apt/lists/* \
    && rm -fr /pecl 
EXPOSE  9000
CMD ["/usr/local/sbin/php-fpm"]
