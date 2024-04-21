# Use the official Tomcat base image with JDK 11
FROM tomcat:9.0-jdk11-openjdk-slim

# Optional: Set environment variables if needed
# ENV SPRING_PROFILES_ACTIVE=prod

# Remove the default web applications deployed with Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy your WAR file into the Tomcat webapps directory
COPY target/onlinebookstore.war /usr/local/tomcat/webapps/ROOT.war

# Expose port 8080 for web access
EXPOSE 8080

# Start Tomcat server
CMD ["catalina.sh", "run"]
