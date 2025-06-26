FROM node:18-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci --ignore-scripts || npm install --ignore-scripts
COPY . .
RUN npm run build
EXPOSE 3000
CMD ["node", "build/index.js"]