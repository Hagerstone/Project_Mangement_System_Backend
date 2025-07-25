# ----------- Stage 1: Build -----------
FROM node:20-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install

COPY . .
RUN npm run build


# ----------- Stage 2: Run -----------
FROM node:20-alpine

WORKDIR /app

# Copy only the built app and runtime deps
COPY --from=builder /app/dist ./dist
COPY --from=builder /app/package*.json ./
RUN npm install --omit=dev

EXPOSE 3000
CMD ["node", "dist/main"]
