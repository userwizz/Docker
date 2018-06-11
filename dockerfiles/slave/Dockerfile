FROM jenkinsci/ssh-slave
LABEL name="Jenkins SSH slave for Robot Framework + Selenium + Firefox"

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

# Python dependency versions
ENV ROBOT_FRAMEWORK_VERSION 3.0.4
ENV SELENIUM_LIBRARY_VERSION 3.1.1

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        dbus \
        firefox-esr \
        git \
        python-pip \
        python-setuptools \
        xvfb \
        && rm -rf /var/lib/apt/lists/*


# Install Robot Framework and Selenium Library
RUN pip install --no-cache \
        robotframework==$ROBOT_FRAMEWORK_VERSION \
        robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION

# Copy script and driver
COPY geckodriver /usr/bin/
COPY start_xvfb.sh /app/
RUN chmod 755 /app/start_xvfb.sh
RUN chmod 755 /usr/bin/geckodriver

# Add scipt to system path
ENV PATH=/app:$PATH

# Start xvfb on start
ENTRYPOINT ["/app/start_xvfb.sh"]

