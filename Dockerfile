FROM java:openjdk-8-jdk

ENV DATACLEANER_VERSION 5.1.3

RUN curl -L https://sourceforge.net/projects/datacleaner/files/datacleaner%20%28stable%29/$DATACLEANER_VERSION/DataCleaner-all.zip/download > /opt/datacleaner.zip && \
    unzip /opt/datacleaner.zip -d /opt && \
    rm -f /opt/datacleaner.zip

VOLUME ["/opt/DataCleaner"]
WORKDIR /opt/DataCleaner
	
CMD ["/opt/DataCleaner/datacleaner.sh", "-version"]