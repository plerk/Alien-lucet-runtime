FROM plicease/ciperl:default

COPY ./alienfile /work/alienfile

RUN  apt-get update \
  && apt-get install -y --no-install-recommends \
       sudo \
       git \
  && apt-get -q autoremove \
  && apt-get -q clean \
  && rm -rf /var/lib/apt/lists/*

RUN cpanm -n App::af
RUN af missing -p configure | cpanm -n
RUN af missing -p share | cpanm -n

USER cip
ENV TMPDIR=/home/cip/tmp

RUN bash -c '                                                       \
  mkdir -p $TMPDIR                                          ;       \
  curl https://sh.rustup.rs -sSf > $TMPDIR/rustup-init.sh   ;       \
  chmod +x $TMPDIR/rustup-init.sh                           ;       \
  $TMPDIR/rustup-init.sh --no-modify-path -y                ;       \
  rm -f $TMPDIR/rustup-init.sh                              ;       \
';
