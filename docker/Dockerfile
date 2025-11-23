
FROM ubuntu:22.04

# Basic packages
RUN apt-get update && \
  apt-get install -y bash curl jq ca-certificates && \
  mkdir -p /cloud-init && \
  chmod 755 /cloud-init

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
