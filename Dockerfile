# Stage 1 build the React app for production
FROM node:latest as node 
WORKDIR /app
COPY . app
RUN npm install 
RUN npm run build    

# Stage 2 use nginx server to serve the app
FROM nginx:alpine
COPY --from=node /app/build /usr/share/nginx/html