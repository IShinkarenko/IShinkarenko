# Use the lightweight Alpine Linux as the base image
FROM nginx:alpine

# Remove the default NGINX configuration
RUN rm /etc/nginx/conf.d/default.conf
COPY default.conf /etc/nginx/conf.d/default.conf

# Copy the static HTML files from the GitHub repository to the NGINX document root
COPY . /usr/share/nginx/html

# Expose port 80 for HTTP traffic
EXPOSE 80

# Start NGINX when the Docker container starts
CMD ["nginx", "-g", "daemon off;"]

#########################################
# Building docker file

#docker build -t website .

# Running docker on port 80

#docker run --name website -p 80:80 -d website 

#Running the site again
#docker rm website
#docker run --name website -p 80:80 -d website 

#docker run --name website --mount type=bind source=/var/www,target=/usr/share/nginx/html,readonly --mount type=bind,source=/var/nginx/conf,target=/etc/nginx/conf,readonly -p 80:80 -d website

# docker run --publish 80:80 website
