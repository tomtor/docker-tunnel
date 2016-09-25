FROM alpine:3.3
RUN apk add --no-cache openssh
RUN ssh-keygen -f /etc/ssh/ssh_host_rsa_key -N '' -t rsa
RUN ssh-keygen -f /etc/ssh/ssh_host_dsa_key -N '' -t dsa
RUN mkdir /root/.ssh/ && chmod 700 /root/.ssh/
COPY authorized_keys /root/.ssh/
RUN chmod 700 /root/.ssh/authorized_keys
#COPY authorized_keys /etc/ssh/
#CMD /usr/sbin/sshd -p 8443 -h /etc/ssh/ssh_host_rsa_key; sleep 2000000
CMD /usr/sbin/sshd -p 8443; sleep 2000000
