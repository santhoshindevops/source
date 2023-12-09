# Use a lightweight base image
FROM node:14-alpine

# Seting working directory, copy package.json and install dependencies
WORKDIR /usr/src/opt
COPY package*.json ./
RUN npm install

# Copy the rest of the app code
COPY . .

# Creating a non-root user named 'app'
RUN adduser -D app

# Set user to 'app'
USER app

# Expose of application port
EXPOSE 3000

# Starting the application
CMD ["npm", "start"]
