FROM node:latest

RUN npm install -g json-server --save-dev
RUN npm link json-server

WORKDIR /data
VOLUME /data

EXPOSE 80

COPY db*.json /data/db.json
COPY server*.js /data/server.js

ADD run.sh /run.sh
ENTRYPOINT ["bash", "/run.sh"]
CMD []
