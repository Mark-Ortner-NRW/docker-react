FROM node:alpine as builder
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:latest
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html

# Example for later use ...

# FROM ubuntu:12.04

# RUN apt-get update
# RUN apt-get install -y nginx zip curl

# RUN echo "daemon off;" >> /etc/nginx/nginx.conf
# RUN curl -o /usr/share/nginx/www/master.zip -L https://codeload.github.com/gabrielecirulli/2048/zip/master
# RUN cd /usr/share/nginx/www/ && unzip master.zip && mv 2048-master/* . && rm -rf 2048-master master.zip

# EXPOSE 80

# # CMD ["/usr/sbin/nginx", "-c", "/etc/nginx/nginx.conf"]