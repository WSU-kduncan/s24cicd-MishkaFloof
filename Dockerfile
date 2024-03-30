# Use an existing nginx image as a base
FROM nginx:alpine

# Copy website files to the appropriate location in the container
COPY ./website /usr/share/nginx/html

# Expose port 80 to allow outside access
EXPOSE 80
