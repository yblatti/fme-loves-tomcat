# Warnings :
# * This Docker file must be buit from project root folder
#   Example : docker build --file docker/elasticsearch/Dockerfile .
FROM tomcat:9-jdk17-temurin-jammy

# Install FME Form / Workstation from deb file (for Ubuntu 22 / Jammy)
RUN apt-get -y update
RUN wget -q -O /tmp/fme.deb https://downloads.safe.com/fme/2024/ubu_22/fme-form-2024_2024.0.1.24202~ubuntu.22.04_amd64.deb \
  && apt-get -y install /tmp/fme.deb \
  && rm /tmp/fme.deb

# Add FME to path
ENV PATH="$PATH:/opt/fme-form-2024"

# Our custom entrypoint for using a license server
COPY ./docker/tomcat-fme/tomcat-fme-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/tomcat-fme-entrypoint.sh
ENTRYPOINT ["tomcat-fme-entrypoint.sh"]

CMD ["catalina.sh", "run"]
