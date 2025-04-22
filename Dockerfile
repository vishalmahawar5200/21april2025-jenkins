FROM ubuntu:latest

# Install Apache
RUN apt update && apt install -y apache2

# Copy your HTML file
WORKDIR /var/www/html
COPY index.html /var/www/html/index.html

# Expose port and run Apache in foreground
EXPOSE 80
CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
