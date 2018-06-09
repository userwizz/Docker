FROM alpine:3.7
LABEL name="Robot Framework + Selenium + Firefox"

# Setup volumes for input and output
#VOLUME /opt/robotframework/reports
#VOLUME /opt/robotframework/tests

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

# Dependency versions
ENV ROBOT_FRAMEWORK_VERSION 3.0.4
ENV SELENIUM_LIBRARY_VERSION 3.1.1

# Install system dependencies
RUN apk update && \
    apk add --no-cache git firefox-esr py-pip xvfb dbus


# Install Robot Framework and Selenium Library
RUN pip install --upgrade pip && \
    pip install --no-cache \
    robotframework==$ROBOT_FRAMEWORK_VERSION \
    robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION

# copy scipt and driver
COPY . /app/
RUN chmod 755 /app/*

# Update system path
ENV PATH=/app:$PATH

# Execute all robot tests
ENTRYPOINT ["/app/run.sh"]
CMD ["git url, robot_command"]

