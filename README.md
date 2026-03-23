# M164-MySQL-Projekt
7 Projektarbeit
Projektauftrag
Sie erstellen eine Datenbank von Grund auf und durchlaufen alle Phasen, bis sich die Daten in der Datenbank befinden. Danach werden die Daten exportiert, um diese auf einem anderen System wieder zu importieren.

 

⚠ Es soll sich um eine realitätsnahe Datenbank und einen realitätsnahen Ablauf handeln:

Es soll sich um eine Datenbank handeln, die auch in der Realität vorkommt oder vorkommen könnte.
Die Datenbank wird von Ihnen erstellt und mit Daten befüllt.
Stellen Sie sich vor, diese Datenbank ist ein paar Monate oder Jahre in Betrieb und enthält am Ende viele Daten.
Danach erstellen Sie einen Export, damit die Daten in eine andere (leere) Datenbank importiert werden können.
Anforderungen
Das konzeptionelle Datenmodell enthält mind. 6 Tabellen, wovon 1 ein Ereignis (Zwischentabelle mit Attributen) sein kann.
Alle Tabellen müssen durch Beziehungen direkt oder indirekt miteinander verbunden sein.
Die Tabellen enthalten genügend Attribute, so dass die Datenbank sinnvoll bewirtschaftet werden kann. Denken Sie an eine Endbenutzer-Applikation, die später erstellt wird.
Beispiel Webshop: Bei den Kunden sollte mind. Vorname, Nachname, Postadresse, Mailadresse, Telefonnummer vorhanden sein. Bei den Artikeln sollte mind. Artikelbezeichnung, Beschreibung, Preis und Kategorie(n) vorhanden sein.
Das konzeptionelle Datenmodell wird mit diagrams.net (draw.io) oder einem ähnlichen Tool gezeichnet. Reverse-Engineering (zuerst die Tabellen erstellen und daraus das Datenmodell generieren) ist nicht erlaubt.
Mind. 2 m:m-Beziehungen (m:m, m:mc oder mc:mc) sind vorhanden
1 davon soll/kann ein Ereignis sein. Beispiel Bibliothek: Jeder Kunde kann viele Bücher ausleihen. Jedes Buch kann von vielen Kunden ausgeliehen werden. Die Ausliehe ist ein Ereignis (Datum von, Datum bis und Preis).
Mind. 1 ist eine m:m-Beziehung ohne Attribute, d.h. die Zwischentabelle ist im konzeptionellen Datenmodell nicht vorhanden.
Mind. 1 1:m- Beziehung ist vorhanden (1:m oder 1:mc).
Mind. 1 c:m-Beziehung ist vorhanden (c:m oder c:mc).
Beispiel Bibliothek: Jeder Autor hat 0 oder 1 Ort, an jedem Ort können mehrere Autoren wohnen.
Das logische Datenmodell wird aus dem konzeptionellen abgeleitet.
Das logische Datenmodell wird mit diagrams.net (draw.io) oder einem ähnlichen Tool gezeichnet. Reverse-Engineering ist nicht erlaubt.
Für das physische Datenmodell werden die CREATE DATABASE-, CREATE TABLE- und allenfalls ALTER TABLE-Befehle erstellt und in einer Skriptdatei gespeichert. Mit dieser Datei soll die Datenbank und die Datenstrukturen auf einem anderen System (identisches RDBMS) erstellt werden können.
Es ist nicht erlaubt, die Tabellen mit einem GUI-Tool zu erstellen und für die Abgabe Skripts zu generieren!
Die Attribute sind mit dem korrekten Datentyp definiert, es sind mind. 4 verschiedene Datentypen aus folgender Menge vorhanden: Fixe Zeichenlänge, variable Zeichenlänge, Ganzzahl, Kommazahl, Datum und Zeit (= nur Datum, Datum + Zeit oder nur Zeit), Boolean/Bit.
In jeder Tabelle ist ein Primärschlüssel enthalten, die Primärschlüsselwerte werden von der Datenbank verwaltet (AUTO INCREMENT).
Die referentielle Integrität muss sichergestellt sein (Primärschlüssel-Fremdschlüssel-Beziehung).
Weitere Constraints:
Die wichtigen Attribute werden als obligatorisch definiert (NOT NULL).
Mind. 2 weitere, verschiedene Constraints (UNIQUE, CHECK, DEFAULT) sind vorhanden.
ON DELETE-Regeln: NO ACTION und CASCADE müssen beide vorhanden sein, alle Regeln sind explizit zu definieren (also auch NO ACTION, wenn dies der Standardwert ist).
Daten einfügen: Jede Tabelle muss mind. 10 Datensätze enthalten.
Ausnahme: Tabellen, die nur Primär- aber nicht Detailtabellen sind, können weniger Datensätze enthalten. Z.B. wenn in einer Tabelle ein Status festgehalten wird und es nicht 10 verschiedene Stati gibt.
💡 Tipp: Wenn Sie Ihre Daten im CSV-Format erfassen und via Bulk-Insert importieren, haben Sie bereits Vorarbeit für die Abgabe gemacht.
Die Daten sind so weit wie möglich realistisch und sinnvoll.
In Primärtabellen sollen einige Datensätze mehrfach referenziert werden. Beispiel: Bei einem Onlineshop sollen einige Kunden mehr als 1 Bestellung gemacht haben und einige Artikel sollen mehr als 1x bestellt worden sein.
Mind. 10 Abfragen (SELECT-Befehle) liegen vor: Abfragen, die der Endkunde durchführen würde, siehe Kapitel weiter unten.
Jede Abfrage gibt mind. 1 Datensatz zurück, mind. die Hälfte der Abfragen gibt mehr als 1 Datensatz zurück.
Die Abfragen enthalten als Kommentar eine kurze Beschreibung, was der Zweck davon ist.
Mind. die Hälfte der Abfragen muss eine oder mehrere WHERE-Bedingungen enthalten.
Die Abfragen dürfen keine Primärschlüsselwerte in den WHERE-Bedingungen enthalten.
In den Abfragen sollen keine Fremdschlüsselwerte ausgegeben werden, anstelle dessen sollen die entsprechenden Datenwerte angezeigt werden (Verknüpfungen mit JOIN).
Export der Daten: Sämtliche Daten müssen im CSV-Format vorliegen, damit diese in einer anderen Datenbank importiert werden können.
Der Import muss - soweit möglich - automatisch erfolgen: In einem Skript sollen sämtliche SQL-Befehle für den Import vorhanden sein.
Am Ende sollten Sie 3 Skripts haben:
Erstellen der Datenbank und der Tabellen (CREATE DATABASE und CREATE TABLE, evtl. zusätzlich ALTER TABLE)
Bulk-Insert (CSV-Import)
Abfragen von Daten (SELECT-Befehle)
Sämtliche Skripts müssen die Endung .sql aufweisen und ohne Fehler ausgeführt werden können.
⚠ Am Ende der Projektarbeit müssen die SQL-Skripts abgeben werden, um die Datenbank inkl. Daten auf einem anderen System zu reproduzieren. Damit alle Datenbanken parallel installiert werden können, sind folgende Vorgaben für den Namen der Datenbank zwingend einzuhalten:[Klasse]_[Laufnummer]_[Datenbankname], Beispiel: INF2024z_01_Musikverwaltung

Die Laufnummer wird von der Lehrperson vergeben.

Die Lehrperson ist frei, andere Vorgaben für die Benennung der Datenbanken zu definieren!

Das Import-Verzeichnis für die CSV-Dateien muss zwingend wie folgt sein: C:\Daten\CSV\

Projektablauf
Sie bilden ein Lerntandem mit einer Kollegin/einem Kollegen
Sie entscheiden sich für ein Thema/Projekt, siehe nächstes Kapitel Projektvorschläge.
Sie entscheiden sich für ein relationales Datenbankmanagementsystem. Neben MariaDB und SQL Server können auch MySQL und PostgreSQL eingesetzt werden. Erkundigen Sie sich vor dem Entscheid bei der Lehrperson, wie der Support bei den verschiedenen Systemen ist.
Sie erstellen eine Dokumentation mit dem Zweck der Datenbank und einer Beschreibung der einzelnen Tabellen und Beziehungen.
Sie erstellen das konzeptionelle Datenmodell aufgrund Ihrer eigenen Anforderungen.
Zeigen Sie das konzeptionelle Datenmodell der Lehrperson und nehmen Sie - falls notwendig - Korrekturen vor.
⚠ Die Besprechung mit der Lehrperson ist als Beratung zu verstehen. Die Lehrperson weist Sie auf Fehler hin, um Folgefehler zu vermeiden. Sie sind selbst verantwortlich dafür, dass alle Anforderungen eingehalten werden, schliesslich handelt es sich um eine Leistungsbeurteilung.
Ausgehend vom konzeptionellen Datenmodell erstellen Sie das logische Datenmodell.
Sie überprüfen, ob sich das logische Datenmodell in der dritten Normalform befindet. Falls nicht, führen Sie die Normalisierung bis zur 3. Normalform durch.
Sie bereiten das physische Datenmodell vor, indem Sie sich Überlegungen zu den Datentypen, Constraints und ON DELETE-Regeln machen.
Sie erstellen die Datenbank und Tabellen mit SQL-DDL-Befehlen: CREATE DATABASE, CREATE TABLE und evtl. ALTER TABLE. Dabei stellen Sie die referentielle Integrität mit Beziehungen (Primär- und Fremdschlüssel) sicher, definieren weitere Constraints und legen Regeln für das Löschen von Datensätzen fest.
Sie fügen Daten in die Tabellen ein: Es müssen mind. 10 Datensätze pro Tabelle vorhanden sein (Ausnahmen: siehe Anforderungen oben).
Sie erstellen 10 praxisnahe Abfragen und lassen keine wichtigen aus.
Falls die Daten noch nicht in CSV-Dateien vorhanden sind: Sie exportieren die Daten von allen Tabellen im CSV-Format.
Sie erstellen ein Skript für den Bulk-Insert: SQL-Befehle, um den Import mit den CSV-Dateien durchzuführen.
Überprüfen Sie, ob alle 3 Skripts vollständig und korrekt sind und testen Sie den gesamten Ablauf!
Geben Sie die 3 Skripts und die CSV-Dateien gemäss Anweisungen der Lehrperson ab (siehe Testen und Abgeben).
Wir nehmen an, dass zwischen den Punkten 12 und 13 die Datenbank längere Zeit im produktiven Einsatz ist und viele Datensätze eingefügt, geändert und gelöscht worden sind!
