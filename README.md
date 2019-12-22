# node-red-docker
A wrapper [Node-RED](http://nodered.org) to Docker/Kubernates image.
Base on [Node Red Heroku](https://github.com/joeartsea/node-red-heroku) from [Atsushi Kojo](https://github.com/joeartsea)

### Deploying Node-RED into Heroku
[![Deploy](https://www.herokucdn.com/deploy/button.png)](https://heroku.com/deploy?template=https://github.com/joeartsea/node-red-heroku)

### Environment that're required

* __NODE_RED_USERNAME__ {string} - the username to secure the editor
* __NODE_RED_PASSWORD__ {string} - the password to secure the editor
* __MONGODB_URI__ {string} - mogodb uri for store flow
* __APPNAME__ {string} - mongodb collection which contain flow
* __LAUNCHMODE__ {string: "dev","prod"} - just for on/off env print out while running
* __NODE_MAX_SIZE__ {number: 384 - 8192} - memory for running node in MB ( --max-old-space-size)

__Example for Docker__
``` bash
docker run --name $CONTAINER_NAME \
-p 1880:1880 \
-e "NODE_RED_USERNAME="$NODE_RED_USERNAME \
-e "NODE_RED_PASSWORD="$NODE_RED_PASSWORD \
-e "MONGODB_URI="$MONGODB_URI \
-e "APPNAME="$APPNAME \
-e "LAUNCHMODE="$LAUNCHMODE \
-e "NODE_MAX_SIZE="$NODE_MAX_SIZE \
node-red-docker:1.0.0
```