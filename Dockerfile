FROM haskell:8 
#WORKDIR /bionitio
#COPY . .

# RUN stack install --resolver ghc-8.4.3

RUN stack install pandoc pandoc-citeproc
ENTRYPOINT ["pandoc"]
