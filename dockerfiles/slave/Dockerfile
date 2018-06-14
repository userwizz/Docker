FROM jenkinsci/ssh-slave
LABEL name="Jenkins SSH slave for Robot Framework + Selenium + Firefox"

# Setup X Window Virtual Framebuffer
ENV SCREEN_COLOUR_DEPTH 24
ENV SCREEN_HEIGHT 1080
ENV SCREEN_WIDTH 1920

# Python dependency versions
ENV ROBOT_FRAMEWORK_VERSION 3.0.4
ENV SELENIUM_LIBRARY_VERSION 3.1.1
ENV REQUESTS_LIBRARY_VERSION 0.4.7
ENV HTTP_LIBRARY_VERSION 0.4.2


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
        robotframework-seleniumlibrary==$SELENIUM_LIBRARY_VERSION \
        robotframework-httplibrary==$HTTP_LIBRARY_VERSION \
        robotframework-requests==$REQUESTS_LIBRARY_VERSION

# Copy script and driver
WORKDIR /app
COPY start_xvfb.sh .
RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.17.0/geckodriver-v0.17.0-linux64.tar.gz && \
    gunzip geckodriver-v0.17.0-linux64.tar.gz && tar xfv geckodriver-v0.17.0-linux64.tar && \
    rm geckodriver-v0.17.0-linux64.tar && chmod 755 /app/* && mv geckodriver /usr/bin/.

# Start xvfb on start
ENTRYPOINT ["/app/start_xvfb.sh"]

