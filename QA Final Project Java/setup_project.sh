#!/bin/bash

set -euo pipefail

PROJECT_DIR="java-project"

echo "Se creează structura proiectului..."

# Crearea directoarelor
mkdir -p \
    "$PROJECT_DIR/config" \
    "$PROJECT_DIR/data" \
    "$PROJECT_DIR/src/test/java/com/IoanaDico/tests"

# Crearea fișierului de configurare al aplicației
cat > "$PROJECT_DIR/config/app.yaml" <<'EOF'
app:
  name: java-project
  version: 1.0.0
EOF

# Crearea Dockerfile pentru Java 17
cat > "$PROJECT_DIR/Dockerfile" <<'EOF'
FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

CMD ["java", "-version"]
EOF

# Crearea README.md
cat > "$PROJECT_DIR/README.md" <<'EOF'
[![GitHub Actions](https://github.com/IoanaDico/qa-final-project-java/actions/workflows/ci.yml/badge.svg)](https://github.com/IoanaDico/qa-final-project-java/actions/workflows/ci.yml)

# Proiect Java 17

Acest proiect oferă o structură inițială pentru un proiect Java 17 orientat
spre teste. În forma actuală, include directoare pentru configurări și date,
un spațiu destinat testelor și un Dockerfile cu Java 17.

**Proiectul nu conține încă o aplicație sau teste executabile.** Dockerfile-ul
pornește Java și afișează versiunea instalată; nu compilează cod și nu rulează
teste. Pentru aceasta, adaugă codul proiectului și un sistem de build, precum
Maven sau Gradle.

## Structura proiectului

```text
java-project/
├── config/
│   └── app.yaml
│   └── app.yaml
├── data/
├── src/test/java/com/IoanaDico/tests/
├── Dockerfile
└── README.md
```

## Rulare cu Docker

Ai nevoie de Docker. Din directorul `java-project/`, construiește și rulează
containerul:

```bash
docker build -t java-project:latest .
docker run --rm java-project:latest
```

La pornire, containerul afișează versiunea Java instalată.
EOF

echo
echo "Proiectul a fost creat cu succes!"
echo "Locație: $PROJECT_DIR"
echo
echo "Structura creată:"
find "$PROJECT_DIR" -print