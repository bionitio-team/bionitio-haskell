FROM haskell:9.6
WORKDIR /bionitio

COPY . /bionitio
RUN stack install --install-ghc
RUN stack install hlint --install-ghc

# Executable is installed into /root/.local/bin.
# The parent Docker puts this directory into the PATH
