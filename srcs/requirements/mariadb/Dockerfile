FROM debian:bullseye

# Set environment variables
ENV MYSQL_DB=wordpress
ENV MYSQL_USER=wordpress
ENV MYSQL_PASSWORD=wordpress
ENV MYSQL_ROOT_PASSWORD=rootpassword

# Update and upgrade the system
RUN apt-get update && apt-get upgrade -y

# Install required packages
RUN apt-get install -y mariadb-server netcat

# Copy file from host to container
COPY ./mdb-conf.sh /mdb-conf.sh

# Set permissions to the file
RUN chmod +x /mdb-conf.sh

# Define entrypoint command to run when the container starts
ENTRYPOINT ["/mdb-conf.sh"]