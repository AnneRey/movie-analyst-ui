FROM node:12
# Create app directory
WORKDIR /usr/src/app
# Bundle app source
COPY . .
RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
EXPOSE 3030
CMD [ "node", "server.js" ]
