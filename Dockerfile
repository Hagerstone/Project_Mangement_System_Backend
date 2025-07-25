FROM node:20-alpine

WORKDIR /app

# Install dependencies
COPY package*.json ./
RUN npm install

# Copy everything (so dist doesn't get skipped by mistake)
COPY . .

# Build the NestJS app
RUN npm run build

# Expose port for Render
EXPOSE 3000

# Start the app (entry point must match dist/main)
CMD ["node", "dist/main"]
