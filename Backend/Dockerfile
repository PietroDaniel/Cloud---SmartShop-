FROM maven:3.8.4-openjdk-11 AS build
WORKDIR /app

COPY pom.xml .
COPY src ./src

RUN mvn clean package -DskipTests && \
    mkdir -p dependency-jars && \
    mvn dependency:copy-dependencies -DoutputDirectory=dependency-jars

FROM tomcat:10.1-jdk11-openjdk-slim

RUN rm -rf /usr/local/tomcat/webapps/*

COPY --from=build /app/target/SmartShop-0.0.1-SNAPSHOT.war /usr/local/tomcat/webapps/ROOT.war

COPY --from=build /app/dependency-jars /usr/local/tomcat/lib/

COPY src/main/webapp/META-INF/Context.xml /usr/local/tomcat/conf/context.xml

EXPOSE 8080

CMD ["catalina.sh", "run"]