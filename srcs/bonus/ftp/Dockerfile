FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY ./vsftpd.conf /etc/vsftpd.conf
COPY ./ftp_conf.sh /ftp_conf.sh
RUN chmod +x /ftp_conf.sh

EXPOSE 21 21000 21001 21002 21003 21004 21005 21006 21007 21008 21009 21010

CMD ["/ftp_conf.sh"]
