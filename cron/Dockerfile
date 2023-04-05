FROM node@sha256:0c3ea57b6c560f83120801e222691d9bd187c605605185810752a19225b5e4d9

RUN apt-get update && apt-get install -y logrotate

WORKDIR /app

# # Add logrotate configuration
# COPY logrotate.conf /etc/logrotate.d/orakl

# RUN chmod 644 /etc/logrotate.d/orakl

# # Add cron job to run logrotate
# RUN echo "* * * * * root /usr/sbin/logrotate /etc/logrotate.conf > /dev/null 2>&1" >> /etc/crontab

# RUN service cron start

CMD ["tail", "-f", "/dev/null"]
