FROM node

# Create app directory
WORKDIR /app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
#WRUN git clone https://github.com/digitalocean/sample-nodejs.git

#COPY package*.json ./
COPY app_sample/ .
RUN npm install
# If you are building your code for production 
# RUN npm ci --only=production


EXPOSE 3000
CMD ["node", "index.js"]
