FROM debian:bullseye

RUN apt-get update && apt-get install -y vsftpd

COPY ./vsftpd.conf /etc/vsftpd.conf
COPY ./ftp_conf.sh /ftp_conf.sh
RUN chmod +x /ftp_conf.sh

EXPOSE 2100 2101 2102 2103 2104 2105

CMD ["/ftp_conf.sh"]
