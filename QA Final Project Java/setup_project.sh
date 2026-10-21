#!/bin/bash

set -euo pipefail

PROJECT_DIR="java-project"

echo "Se creează structura proiectului..."

# Crearea directoarelor
mkdir -p \
    "$PROJECT_DIR/config" \
    "$PROJECT_DIR/data" \
    "$PROJECT_DIR/src/test/java/com/IoanaDico/tests"

# Crearea Dockerfile pentru Java 17
cat > "$PROJECT_DIR/Dockerfile" <<'EOF'
FROM eclipse-temurin:17-jdk

WORKDIR /app

COPY . .

CMD ["java", "-version"]
EOF

# Crearea README.md
cat > "$PROJECT_DIR/README.md" <<'EOF'
# Java Project

Proiect Java 17 cu structură inițială pentru teste.

## Structura proiectului

```text
java-project/
├── config/
├── data/
├── src/
│   └── test/
│       └── java/
│           └── com/
│               └── IoanaDico/
│                   └── tests/
├── Dockerfile
└── README.md
```

## Cerințe

- Linux
- Docker
- Java 17 (opțional pentru dezvoltare locală)

## Construirea imaginii Docker

```bash
docker build -t java-project:latest .
```

## Rularea containerului

```bash
docker run --rm java-project:latest
```

Containerul afișează versiunea Java instalată.

## Directoare

- `config/` - fișiere de configurare
- `data/` - date și fișiere de intrare
- `src/test/java/com/IoanaDico/tests/` - teste Java

## Observație

Pentru compilarea și executarea testelor, adaugă
un sistem de build, precum Maven sau Gradle.
EOF

echo
echo "Proiectul a fost creat cu succes!"
echo "Locație: $PROJECT_DIR"
echo
echo "Structura creată:"
find "$PROJECT_DIR" -print