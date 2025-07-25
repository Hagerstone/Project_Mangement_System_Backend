# backend/Dockerfile
FROM node:20-alpine

WORKDIR /app

COPY package*.json ./
RUN npm ci --omit=dev

# Copy only source files and build output for smaller image and correct context
COPY . ./

# Build the project
RUN npm run build

EXPOSE 3000

# Start the app in production mode
CMD ["node", "dist/main.js"]

