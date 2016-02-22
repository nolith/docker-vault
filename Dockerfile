FROM progrium/busybox
MAINTAINER Alessio Caiazza <alessio@chorally.com>
ENV REFRESHED_AT 2016-02-22
ENV VAULT_VERSION 0.5.0

ADD https://releases.hashicorp.com/vault/${VAULT_VERSION}/vault_${VAULT_VERSION}_linux_amd64.zip /tmp/vault.zip
RUN cd /bin && unzip /tmp/vault.zip && chmod +x /bin/vault && rm /tmp/vault.zip

EXPOSE 8200
ENV VAULT_ADDR "http://127.0.0.1:8200"

ENTRYPOINT ["/bin/vault"]
CMD ["server", "-dev"]
