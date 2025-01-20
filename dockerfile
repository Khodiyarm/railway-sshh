# Use Ubuntu as base image
FROM ubuntu:latest

# Install OpenSSH server
RUN apt update && apt install -y openssh-server && mkdir /var/run/sshd

# Set root password (change 'yourpassword' to a strong password)
RUN echo 'root:yourpassword' | chpasswd

# Allow root login
RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config

# Expose SSH port
EXPOSE 22

# Start SSH server
CMD ["/usr/sbin/sshd", "-D"]
