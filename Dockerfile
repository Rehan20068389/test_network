# Use an official Node.js image
FROM node:18-alpine

# Create app directory
WORKDIR /app

# Copy package files first for caching
COPY package*.json ./

# Install only production dependencies
RUN npm ci --only=production

# Copy remaining app files
COPY . .

# Expose port 3001
EXPOSE 3001

# Run app
CMD ["npm", "start"]