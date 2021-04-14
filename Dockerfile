FROM node:12.22.1
WORKDIR /workspace
COPY dev.sh /workspace

RUN git clone https://github.com/oam-dev/kubevela.io.git && cd kubevela.io && git checkout -b dev

ENTRYPOINT [ "bash", "dev.sh" ]
CMD [ "-t" "start" ]