FROM haskell:8 
#WORKDIR /bionitio
#COPY . .

# RUN stack install --resolver ghc-8.4.3

# RUN cabal update && cabal install pandoc pandoc-citeproc
RUN cabal new-update && cabal new-install
#ENTRYPOINT ["pandoc"]
