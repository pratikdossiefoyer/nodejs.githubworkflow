FROM node:18-alpine

WORKDIR /app

# Copy package files and install dependencies
COPY package*.json ./
RUN npm ci --only=production

# Copy application code
COPY . .

# Create a .env file with environment variables (these will be overridden by GitHub secrets)
RUN touch .env

# Expose the port your application runs on
EXPOSE 3000

# Start the application
CMD ["npm", "start"]
