FROM centos:7
RUN yum -y install bind-utils bind && \
  yum clean all

ADD config /
RUN rndc-confgen -a -c /etc/rndc.key && \
  chown named:named /etc/rndc.key && \
  chmod 755 /entrypoint.sh

EXPOSE 53/udp 53/tcp
ENTRYPOINT ['/entrypoint.sh']
CMD ["/usr/sbin/named"]
