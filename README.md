# Mobile Probeaufgabe Lucas Schmidt

## Setup

In das Hauptverzeichnis des Projektes wird eine `.env`-Datei angelegt, welche die Umgebungsvariablen für den `CAT_API_KEY` enthält (Beispiel in `.env.example`).

## Aufgabe 2

### Vote-Funktionalität

- In die Benutzeroberfläche wird ein ein neuer Bereich fürs "Voting" eingefügt (upvote / downvote).
- In das Breed-Repository wird eine neue Methode hinzugefügt, welches die Image-ID, sowie das Voting als Integer erwartet.
- Wenn später die Votes wieder geladen werden sollen, wird wahrscheinlich eine eindeutige "sub_id" benötigt.
- Test-Fälle:
  - Anzeige von Up-/Downvotes beim Laden der Breed-Details
  - Wenn man Up-/Downvotet sollen die Buttons während dem Ladenstates nicht aktiv sein.

### Bilder Suche

- Neuer Screen mit Filterung nach Rasse durch Breed-ID
- Repository-Methode `searchImages({String? breedId})`
- Grid-Darstellung der Suchergebnisse
- Test-Fälle:
  - Bilder werden nach Filterung korrekt geladen
  - Leerer State wenn keine Ergebnisse
- Technische Herausforderungen:
  - Debouncing bei Texteingabe um API-Calls zu reduzieren

## Aufgabe 4

### Schlechte bis keine Netzwerkverfügbarkeit

- Geladene Rassen lokal cachen (-> autodispose bei providern entfernen)
- Eventuell Daten in lokaler DB speichern (z.B. sqflite)
- Banner anzeigen um Benutzer zu informieren, dass die App offline ist
- Retry-Button im Error-State

### Fehlerfälle & Fehlerbehandlung

- Behandelbare Fehler mit sinnvollen Fehlermeldungen dem Benutzer anzeigen
- Unbehandelte Fehler evtl. durch Tools wie Sentry melden

### Persistenz

- App-Daten nach Abruf der DB in lokaler DB speichern (z.B. sqflite)
- Implementierung von einem `breedRepositoryLocal`

### Lokalisierung

- `flutter_locaizations`-Package installieren
- Für jede benötigte Sprache eine `.arb`-Datei erstellen und mit Keys/Values füllen
- Strings in der App mit z.B. `AppLocalizations.of(context).breedName` ausgeben

### Wichtigkeit der Usability

- Kontrast bei UI überprüfen, um gute Lesbarkeit zu gewährleisten
- `Semantics"-Widgets für Screen-Reader nutzen
- Einstellbares High-Contrast-Theme in App-Einstellungen
- Einstellbare Skalierbarkeit (Textgrößen)
- Mindestgröße von Tap-Targets beachten
