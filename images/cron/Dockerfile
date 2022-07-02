# Pulling Ubuntu image
FROM ubuntu:20.04

# Updating packages and installing cron
RUN apt-get update && apt-get install cron -y 

# Copying script file into the container
COPY top10.sh /root/top10.sh

# Giving executable permission to the script file
RUN chmod +x /root/top10.sh

RUN touch /var/log/top10IPs.log

# Adding crontab to the appropriate location
ADD crontab /etc/cron.d/my-cron-file

# Giving permission to crontab file
RUN chmod 0644 /etc/cron.d/my-cron-file

# Running crontab
RUN crontab /etc/cron.d/my-cron-file

# Creating entry point for cron 
ENTRYPOINT ["cron", "-f"]

# Add the cron job
#RUN crontab -l | { cat; echo "*/1 * * * * bash /top10.sh"; } | crontab -

# Run the command on container startup
#CMD cron