# Start with a base image containing Java runtime
FROM amazoncorretto:21-alpine-full

# The application's .jar file
WORKDIR /src/
COPY . .

# Add Maven to the PAT

# Install Maven
RUN apk add maven
RUN apk add bash


ENV MAVEN_HOME /usr/share/maven
ENV PATH $MAVEN_HOME/bin:$PATH

RUN echo "Test"

# Build the project
RUN mvn install -DskipTests -Dfmt.skip -Dflyway.skip=true



# Install Flyway
#RUN wget -qO- https://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/10.13.0/flyway-commandline-10.13.0-linux-x64.tar.gz | tar xvz && \
#    ln -s `pwd`/flyway-10.13.0/flyway /usr/local/bin

# Add Flyway to the PATH
#ENV FLYWAY_HOME /flyway
#ENV PATH $FLYWAY_HOME:$PATH
#
## Copy your flyway scripts into the container
#COPY ./src/main/resources/db/migration /flyway/sql

# Run Flyway migrations
# Run the application
CMD mvn flyway:migrate && java -cp target/classes:target/dependency/* ch.sbb.pfi.netzgrafikeditor.NetzgrafikEditorBackendApplication