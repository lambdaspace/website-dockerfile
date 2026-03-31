############################################################
# Dockerfile to build Lambda Space MQTT broker
# Based on Debian
############################################################

# Set the base image to Debian
FROM debian:stretch-20220622

################## BEGIN INSTALLATION ######################
RUN apt-get update && \
    apt-get dist-upgrade -y && \
    apt-get install -y apt-transport-https ca-certificates mosquitto

# Mosquito configuration
COPY credentials/mqtt /var/local/mosquitto

################## INSTALLATION END ######################

EXPOSE 8883
CMD mosquitto -c /var/local/mosquitto/mosquitto.conf
