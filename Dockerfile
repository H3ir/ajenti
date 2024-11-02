# Basis-Image festlegen, z.B. Debian oder Ubuntu
FROM ubuntu:20.04

# Aktualisieren und benötigte Pakete installieren
RUN apt-get update && apt-get install -y \
    python3 python3-pip \
    curl wget sudo \
    && rm -rf /var/lib/apt/lists/*

# Ajenti und Ajenti Panel Plugin installieren
RUN pip3 install ajenti ajenti-panel ajenti.plugin.core

# Konfigurationsverzeichnis erstellen
RUN mkdir -p /etc/ajenti

# Standard-Port öffnen
EXPOSE 8000

# Startbefehl festlegen
CMD ["ajenti-panel", "-d"]
