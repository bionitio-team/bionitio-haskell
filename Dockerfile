FROM haskell:8 
WORKDIR /bionitio

RUN cabal update

COPY ./bionitio-hs.cabal /bionitio/bionitio-hs.cabal

RUN cabal install --only-dependencies -j4

COPY . /bionitio

RUN cabal install bionitio-hs
ENTRYPOINT ["bionitio"]
