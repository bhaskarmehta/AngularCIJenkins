FROM node:alpine as build
WORKDIR /app
COPY . .
RUN npm install
RUN npm run build
# Using Alpine Version of Nginx for smaller image size
FROM nginx:alpine
COPY --from=build app/dist/electric-equipment-ui usr/share/nginx/html
EXPOSE 80
