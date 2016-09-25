FROM alpine:3.3
RUN apk add --no-cache openssh
RUN ssh-keygen -f /my_rsa_key -N '' -t rsa && chmod 400 /my_rsa_key
COPY connect.sh /
EXPOSE 5432
CMD /connect.sh
