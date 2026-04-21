# Build stage
FROM node:20-alpine AS build

WORKDIR /app

# Copy package files first for caching
COPY package.json ./
RUN npm install

# Copy source code
COPY . .

# Build the site
RUN npm run build

# Production stage
FROM nginx:alpine

# Copy built assets from Astro
COPY --from=build /app/dist /usr/share/nginx/html
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
