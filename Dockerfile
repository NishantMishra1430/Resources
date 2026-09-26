# What is a Dockerfile ?
# Dockerfile is a simple text file, containing set of instructions for building a Docker image
# Why we use Dockerfile OR what is the use of Dockerfile ?
# in Simple language, This automates the process of Docker image creation 

# *****< FOCUSED WORK CAN REALLY CREATE EX-COMPLEMENTS >*****

# Sets the base image
FROM node:18         

# sets a default working directory inside docker img/container        
WORKDIR /app

# Copies the Dependencies file from local directory to current directory
COPY package*.json ./

# It runs npm install and downloads the all important dependencies from /app where we copied the whole package*.json
RUN npm install

# Takes of all the remaining dependencies and stuff from local --> image 
COPY . .

# Exposing PORT of this image is 3000
EXPOSE 3000

# It is a Default Command for Execution 
CMD ["node", "app.js"]


# RUN COMMAND: docker build -t <image_name> <PATH>
#  Example:    docker build -t node-img .            
