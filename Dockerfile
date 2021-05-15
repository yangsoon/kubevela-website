FROM node:14.17
WORKDIR /workspace
COPY dev.sh /workspace

RUN git init kubevela.io

ENTRYPOINT [ "bash", "dev.sh" ]
CMD [ "-t" "start" ]