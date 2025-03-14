# Use official PHP with Apache
FROM php:7.4-apache

# Set working directory
WORKDIR /var/www/html

# Enable necessary PHP extensions
RUN docker-php-ext-install mysqli pdo pdo_mysql

# Enable Apache mod_rewrite (needed for .htaccess)
RUN a2enmod rewrite

# Copy backend PHP files into the container
COPY . /var/www/html/

# Ensure Apache can serve the files
RUN chown -R www-data:www-data /var/www/html && chmod -R 755 /var/www/html

# Install Composer (if needed)
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Expose the default Apache port
EXPOSE 80

# Healthcheck for AWS ECS
HEALTHCHECK --interval=30s --timeout=10s --retries=3 \
  CMD curl -f http://localhost || exit 1

# Start Apache in the foreground
CMD ["apache2-foreground"]

