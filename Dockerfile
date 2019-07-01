FROM haskell:8.4.3
WORKDIR /bionitio
COPY . .

# RUN stack install --resolver ghc-8.4.3
RUN stack setup
RUN stack install 