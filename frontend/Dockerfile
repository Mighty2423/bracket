
# Use the latest Nginx image
FROM nginx:latest

# Set working directory
WORKDIR /usr/share/nginx/html

# Copy custom Nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

# Copy frontend files to Nginx directory
COPY . /usr/share/nginx/html/

# Expose port 80 for the frontend
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]

