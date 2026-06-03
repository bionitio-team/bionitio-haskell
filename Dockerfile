FROM haskell:7.10
WORKDIR /bionitio

COPY . /bionitio
RUN stack install hlint --resolver lts-5.14 --system-ghc
RUN stack install

# Executable is installed into /root/.local/bin.
# The parent Docker puts this directory into the PATH
