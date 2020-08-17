# Build phase
FROM node:alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# Run phase
FROM nginx:alpine
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html








