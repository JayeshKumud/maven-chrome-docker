#
# Build stage
#
FROM maven:3.6.3-openjdk-14-slim as build

ARG CHROME_VERSION=99.0.4844.51-1
RUN apt-get update && apt-get install -y wget -Y gnupg \
  && wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google.list \
  && apt-get update \
  && apt-get install -y google-chrome-stable=$CHROME_VERSION xvfb \
  && CHROME_BIN='/usr/bin/google-chrome-stable'
