FROM maven:3.8.4-openjdk-17

WORKDIR /app

COPY pom.xml .
COPY src/ ./src/
COPY java-project/src/test/ ./java-project/src/test/

RUN mvn --batch-mode --no-transfer-progress package

CMD ["java", "-jar", "target/qa-final-project-java-1.0.0.jar"]
