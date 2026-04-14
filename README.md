# Mobile Probeaufgabe Lucas Schmidt

## Setup

In das Hauptverzeichnis des Projektes wird eine `.env`-Datei angelegt, welche die Umgebungsvariablen für den `CAT_API_KEY` enthält (Beispiel in `.env.example`).

## Architektur

Die App basiert auf dem Feature-First-Pattern. Jedes Feature (z.B. Breed) ist in drei Bereiche aufgeteilt:

- Data-Layer: Abstraktes Repository mit Dokumentation von benötigten Methoden, sowie verschieden Implementationen. In diesem Fall `BreedRepositoryRemote` für die API und `BreedRepositoryFake` für Testzwecke.
- Domain-Layer: Alle benötigten Modells, basierend auf der API-Dokumentation.
- Presentation-Layer
  - Widgets: Darstellung der Daten in einer UI. `*_screen.dart` für Seiten
  - Controller: Steuer die UI-Darstellung und greift auf die Repositories zu

Sonstiges:

- In dem Ordner `shared` befinden sich Exceptions und Services wie z.B. den `ApiClientService` für die API-Kommunikation.
- In Ordner `util` befinden sich extensions und Interceptor für die API-Kommunikation.
- In Ordner `core/routing` befinden sich die Routen für die App

## Implementierte Features

- Liste aller Rassen mit Name, Bild und kurzer Beschreibung
- Detail-Seite einer Rasse mit Bild, Name, Beschreibung, Herkunft, etc.
- Voting-Funktionalität (upvote / downvote) auf der Detail-Seite
- Bilder-Suche pro Rasse (21 Bilder aktuell)

## Aufgabe 2 - Planung

### Vote-Funktionalität

- API-Möglichkeiten überprüfen
- In die Benutzeroberfläche wird ein ein neuer Bereich fürs "Voting" eingefügt (upvote / downvote).
- Neues Modell `Vote`
- In das Breed-Repository wird eine neue Methode hinzugefügt, welches das Vote-Modell erwartet.
- Wenn später die Votes wieder geladen werden sollen, wird wahrscheinlich eine eindeutige "sub_id" benötigt.
- Test-Fälle:
  - Anzeige von Up-/Downvotes beim Laden der Breed-Details
  - Wenn man Up-/Downvotet sollen die Buttons während dem Ladenstates nicht aktiv sein.

### Bilder Suche

- API-Möglichkeiten überprüfen
- Neuer Screen mit Filterung nach Rasse durch Breed-ID
- Repository-Methode `searchImages(String breedId)`
- Grid-Darstellung der Suchergebnisse
- Test-Fälle:
  - Bilder werden nach Filterung korrekt geladen
  - Leerer State wenn keine Ergebnisse

## Aufgabe 4 - Konzepte

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

- `flutter_localizations`-Package installieren
- Für jede benötigte Sprache eine `.arb`-Datei erstellen und mit Keys/Values füllen
- Strings in der App mit z.B. `AppLocalizations.of(context).breedName` ausgeben

### Wichtigkeit der Usability

- Kontrast bei UI überprüfen, um gute Lesbarkeit zu gewährleisten
- `Semantics-Widgets` für Screen-Reader nutzen
- Einstellbares High-Contrast-Theme in App-Einstellungen
- Einstellbare Skalierbarkeit (Textgrößen)
- Mindestgröße von Tap-Targets beachten

## Was ich mit mehr Zeit noch umgesetzt hätte

- Implementierung von Pagination bei der Breed-Liste und Bilder-Suche
- Weitere Test-Fälle für Voting & Bilder-Suche, etc. implementiert
- Neuer Bottom-Navigation-Bereich mit Tab für "Favoriten"
- Einstellbare `sub_id` für eindeutige Benutzer-Identifikation
