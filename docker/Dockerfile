# Use the latest Nginx image
FROM nginx:latest

# Copy the frontend files to the Nginx directory
COPY ./frontend/ /usr/share/nginx/html/

# Expose port 80 for the frontend
EXPOSE 80

# Run Nginx in the foreground
CMD ["nginx", "-g", "daemon off;"]
