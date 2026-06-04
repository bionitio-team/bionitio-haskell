# Use a modern image to obtain a current CA bundle, then copy it into the
# haskell:7.10 (Debian Jessie) stage whose own CA bundle is too old to
# verify GitHub's certificate chain.
FROM ubuntu:22.04 AS ca-certs
RUN apt-get update && apt-get install -y --no-install-recommends ca-certificates

FROM haskell:7.10
WORKDIR /bionitio

COPY --from=ca-certs /etc/ssl/certs/ca-certificates.crt /usr/local/share/ca-certificates/ubuntu-bundle.crt
RUN update-ca-certificates

COPY . /bionitio
RUN stack install --system-ghc
RUN stack install hlint --resolver lts-5.14 --system-ghc

# Executable is installed into /root/.local/bin.
# The parent Docker puts this directory into the PATH
