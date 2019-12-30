FROM ubuntu
RUN apt-get -y update && apt-get -y install ca-certificates openssl
RUN mkdir /usr/local/share/ca-certificates/newcert
COPY cert.pem /usr/local/share/ca-certificates/newcert
COPY key.pem /root/key.pem
RUN update-ca-certificates
CMD ["openssl", "s_server", "-accept", "443", "-cert", "/usr/local/share/ca-certificates/newcert/cert.pem", "-key", "/root/key.pem", "-www"]
