# Start with a base image containing Java runtime
FROM amazoncorretto:21-alpine-full

# The application's .jar file
WORKDIR /src/
COPY . .

# Add Maven to the PAT

# Install Maven
RUN apk add maven

ENV MAVEN_HOME /usr/share/maven
ENV PATH $MAVEN_HOME/bin:$PATH

# Build the project
RUN mvn clean install -DskipTests

RUN mvn flyway:migrate

# Run the application
ENTRYPOINT ["java","-jar","/app.jar"]