FROM alpine:3.7
LABEL name="Robot Framework + Selenium + Firefox"

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

# Python depency versions
ENV ROBOT_FRAMEWORK_VERSION 3.0.4
ENV SELENIUM_LIBRARY_VERSION 3.1.1

# Install needed packages
RUN apk update && \
    apk add --no-cache \
        dbus \
        firefox-esr \
        git \
        py-pip xvfb 

# Install Robot Framework and Selenium Library
RUN pip install --upgrade pip && \
    pip install --no-cache \
    robotframework==$ROBOT_FRAMEWORK_VERSION \
    robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION

# Copy script and driver
COPY . /app/
RUN chmod 755 /app/*

# Add files to path
ENV PATH=/app:$PATH

# Run script on start
ENTRYPOINT ["/app/run.sh"]

