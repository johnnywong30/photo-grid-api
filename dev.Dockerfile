# Use the official Node.js image as the base image
FROM node:20-slim

# Install apt dependencies for watching nestjs process
RUN apt-get update; \
    apt-get install --no-install-recommends --no-install-suggests -q -y \
        procps \
        ; \
    apt-get autoremove -y; \
    apt-get clean; \
    rm -rf \
        /var/cache/apt/archives \
        /var/cache/ldconfig/* \
        /var/lib/apt/lists/* \
        /var/log/alternatives.log \
        /var/log/apt/* \
        /var/log/dpkg.log
        
# Install pnpm
RUN npm install -g pnpm@9

# Expose the application port
EXPOSE 8000

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json to the working directory
COPY package.json ./

# Install the application dependencies
RUN pnpm i

# Command to run the application in development mode
CMD ["pnpm", "run", "dev"]