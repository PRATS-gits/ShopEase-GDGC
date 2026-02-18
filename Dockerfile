# Stage 1: Build
FROM node:22-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Copy Prisma schema
COPY prisma ./prisma/

# Install dependencies
RUN npm install

# Generate Prisma Client
RUN npx prisma generate

# Copy source code
COPY . .

# Build the application
RUN npm run build

# Stage 2: Production
FROM node:22-alpine AS production

WORKDIR /app

ENV NODE_ENV=production
ENV PORT=3000

# Copy package files
COPY package*.json ./

# Install only production dependencies
RUN npm install --omit=dev

# Copy built application
COPY --from=builder /app/dist ./dist

# Copy Prisma schema and migrations (needed for runtime db operations)
COPY --from=builder /app/prisma ./prisma

# Generate Prisma Client for production environment
RUN npx prisma generate

EXPOSE 3000

CMD ["node", "dist/server.js"]
