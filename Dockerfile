# Build phase
FROM node as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# Run phase
FROM nginx
EXPOSE 80
COPY --from=builder /app/build  /usr/share/nginx/html








