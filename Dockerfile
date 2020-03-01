FROM node:8

# Home directory for Node-RED application source code.
RUN mkdir -p /usr/src/node-red-docker

# User data directory, contains flows, config and nodes.
RUN mkdir /data

WORKDIR /usr/src/node-red-docker

# Add node-red user so we aren't running as root.
RUN useradd -ms /bin/bash node-red && adduser node-red sudo \
    && chown -R node-red:node-red /data \
    && chown -R node-red:node-red /usr/src/node-red-docker

USER node-red

# package.json contains Node-RED NPM module and node dependencies
ADD public /usr/src/node-red-docker/public
ADD nodes /usr/src/node-red-docker/nodes
COPY package.json /usr/src/node-red-docker/
COPY mongostorage.js /usr/src/node-red-docker/
COPY settings.js /usr/src/node-red-docker/
COPY LICENSE /usr/src/node-red-docker/
COPY README.md /usr/src/node-red-docker/

RUN npm install

# User configuration directory volume
VOLUME ["/data"]
EXPOSE 1880

# Environment variable holding file path for flows configuration
ENV FLOWS=flows.json

CMD ["npm", "start"]