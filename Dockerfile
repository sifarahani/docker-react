FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm config set strict-ssl false
RUN npm install
COPY . .
RUN npm run build
 
FROM nginx
COPY --from=0 /app/build /usr/share/nginx/html