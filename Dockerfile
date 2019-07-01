FROM haskell:8 
WORKDIR /bionitio

RUN cabal new-update

COPY ./bionitio-hs.cabal /bionitio/bionitio-hs.cabal

RUN cabal new-install --only-dependencies -j4

COPY . /bionitio

RUN cabal new-install
ENTRYPOINT ["bionitio"]
