# Fika Headless – Setup-Anleitung

Diese Anleitung beschreibt, wie ihr den Fika-Headless-Client vorbereitet und anschließend in Docker oder Podman betreibt.

---

## 1️⃣ Vorbereitung des Fika-Headless-Clients  
*(auf dem PC, auf dem auch EFT installiert ist)*

1. Ein leeres Verzeichnis anlegen, z. B.:  
   C:\FikaHeadless

2. Den SPT-Installer in dieses Verzeichnis kopieren.

3. Den SPT-Installer ausführen und SPT frisch in dieses neue Verzeichnis installieren.

4. Diese frische Installation mindestens einmal ausführen. 
Ergo "SPT.Server" starten und das Spiel mit dem "SPT.Launcher" starten bis ins Hauptmenü.

5. Die Datei "swiftxp-prepare-fika-headless.ps1" in das Verzeichnis kopieren und anschließend per PowerShell ausführen.

6. Die Datei "swiftxp-prepare-fika-headless.ps1" danach wieder löschen.

7. Den Inhalt von "fika-headless-setup.7z" in das Verzeichnis extrahieren.

---

## 2️⃣ Volume für Docker/Podman erstellen

### Docker
```
docker volume create fika-headless
```

### Podman
```
podman volume create fika-headless
```

---

## 3️⃣ Dateien in das Volume kopieren

Kopiert die Inhalte aus C:\FikaHeadless in das neu erstellte Volume.  
Der genaue Vorgang hängt von eurer Umgebung ab.

Beispiel (Windows → Linux):

1. Dateien von Windows auf das Linux-System übertragen.  
2. Anschließend in das Volume-Verzeichnis kopieren, z. B.:
   ```
   /var/lib/containers/storage/volumes/fika-headless/_data
   ```

---

## 4️⃣ Docker/Podman-Container starten

Wichtig: Die PROFILE_ID unbedingt durch eure zugewiesene ID ersetzen.

### Docker
```
docker run -d --name fika-headless --restart unless-stopped --mount type=volume,source=fika-headless,target=/opt/tarkov -e PROFILE_ID=69235752f1416142c79825ec -e SERVER_URL=91.214.190.220 -e SERVER_PORT=6969 -e ENABLE_LOG_PURGE=true -e AUTO_RESTART_ON_RAID_END=false -p 25565:25565/udp ghcr.io/zhliau/fika-headless-docker:latest
```

### Podman
```
podman run -d --name fika-headless --restart unless-stopped --mount type=volume,source=fika-headless,target=/opt/tarkov -e PROFILE_ID=69235752f1416142c79825ec -e SERVER_URL=91.214.190.220 -e SERVER_PORT=6969 -e ENABLE_LOG_PURGE=true -e AUTO_RESTART_ON_RAID_END=false -p 25565:25565/udp ghcr.io/zhliau/fika-headless-docker:latest
```

---

## 5️⃣ Fertig!

Der Headless-Client benötigt 2–3 Minuten, um sich beim SPT-Server zu registrieren.  
Sobald das erfolgt ist, sollte er im Host-Raid-Menü erscheinen.
