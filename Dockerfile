FROM haskell:7.10
WORKDIR /bionitio

# The Jessie CA bundle is too old to verify GitHub's current certificate.
# Download the current Mozilla CA bundle so stack can reach raw.githubusercontent.com.
RUN curl --insecure -L -o /usr/local/share/ca-certificates/mozilla.crt https://curl.se/ca/cacert.pem && \
    update-ca-certificates

COPY . /bionitio
RUN stack install --system-ghc
RUN stack install hlint --resolver lts-5.14 --system-ghc

# Executable is installed into /root/.local/bin.
# The parent Docker puts this directory into the PATH
