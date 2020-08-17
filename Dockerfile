# Build phase
FROM node
WORKDIR '/app'
COPY package*.json ./
RUN npm install
COPY . .
CMD ["npm", "run", "build"]

# Run phase
FROM nginx
EXPOSE 80
COPY --from=0 /app/build  /usr/share/nginx/html








