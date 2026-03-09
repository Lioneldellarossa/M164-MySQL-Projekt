USE `INF2025G-M164-Lionel_Joel-Lagerverwaltung`;

-- 1. Abfrage: Alle Kunden und ihre zugehörigen Aufträge (Angebote) mit Gesamtsumme
-- Zweck: Übersicht über das Bestellvolumen je Kunde.
SELECT
    K.Kundenname,
    K.Versandzone,
    A.Angebot AS Angebotsnummer,
    A.Date AS Datum,
    A.Ges_Preis AS Gesamtpreis
FROM KUNDE K
JOIN AUFTRAG A ON K.ID_Kunde = A.Kunde_ID
WHERE K.Versandzone = 'Express';

-- 2. Abfrage: Artikel und die zugehörigen Auftragsinformationen sowie Kunden
-- Zweck: Listet auf, welcher Kunde welche Artikel (Menge und Preis) bestellt hat.
SELECT
    K.Kundenname,
    A.Angebot,
    ART.Artikelnummer,
    ART.Artikeltext,
    ART.Menge,
    ART.Stückpreis,
    (ART.Menge * ART.Stückpreis) AS Gesamtwert_Artikel
FROM ARTIKEL ART
JOIN AUFTRAG A ON ART.Angebot_ID = A.ID_Angebot
JOIN KUNDE K ON A.Kunde_ID = K.ID_Kunde
WHERE ART.Menge > 20;

-- 3. Abfrage: Welche Tafeln (Materialien) werden für welche Artikel benötigt?
-- Zweck: Materialbedarfsplanung (Tafeln & Werkstoffe) für die Artikel.
SELECT
    ART.Artikeltext,
    ART.Menge AS Produktionsmenge,
    T.TafelLänge,
    T.TafelBreite,
    T.Dicke,
    W.Werkstoff,
    W.Werkstofftyp
FROM ARTIKEL ART
JOIN TAFELN T ON ART.Tafel_ID = T.ID_Tafel
JOIN WERKSTOFF W ON T.Werkstoff_ID = W.ID_Werkstoff
WHERE T.Dicke >= 5;

-- 4. Abfrage: Maschinen und ihre durchgeführten Arbeitsschritte
-- Zweck: Übersicht über die Maschinen und die darauf ausgeführten Operationen.
SELECT
    M.Maschinenname,
    M.Bearbeitungstyp,
    AK.Arbeitsschritt AS Arbeitsschritt_Bezeichnung,
    AK.Kuerzel
FROM Maschine M
JOIN ARBEITSSCHRITTKENNUNG AK ON M.ID_Maschine = AK.Maschine_ID
WHERE M.Bearbeitungstyp IN ('Fräsen', 'Drehen');

-- 5. Abfrage: Zeit- und Kostenaufwand für Arbeitsschritte je Artikel
-- Zweck: Ermittlung der Produktionszeiten und internen Stundensätze für Artikel.
SELECT
    ART.Artikelnummer,
    ART.Artikeltext,
    AK.Arbeitsschritt,
    ARS.Bearbeitungszeit,
    ARS.StundensatzOperation
FROM ARTIKEL_ARBEITSSCHRITT AA
JOIN ARTIKEL ART ON AA.Artikel_ID = ART.ID_Artikel
JOIN ARBEITSSCHRITT ARS ON AA.Arbeitsschritt_ID = ARS.ID_Arbeitsschritt
JOIN ARBEITSSCHRITTKENNUNG AK ON ARS.Arbeitsschrittkennung_ID = AK.ID_Arbeitsschrittkennung
WHERE ARS.StundensatzOperation > 80;

-- 6. Abfrage: Artikel mit hohem Materialverbrauch (Gewicht über 5)
-- Zweck: Filtert schwere Artikel, um Logistik- und Versandkosten besser zu kalkulieren.
SELECT
    Artikelnummer,
    Artikeltext,
    Gewicht,
    BenötigteTafeln
FROM ARTIKEL
WHERE Gewicht > 5;

-- 7. Abfrage: Angebote eines bestimmten Zeitraums
-- Zweck: Umsatzauswertung für Angebote, die im Jahr 2023 erstellt wurden.
SELECT
    Angebot,
    ErstelltVon,
    Date AS Erstellungsdatum,
    Ges_Preis
FROM AUFTRAG
WHERE YEAR(Date) = 2023;

-- 8. Abfrage: Materialwert (Tafeln) je Einkaufspreis
-- Zweck: Übersicht über teure eingekaufte Tafeln für die Buchhaltung.
SELECT
    T.ID_Tafel AS TafelNummer,
    W.Werkstoff,
    T.Einkauf_Kg AS Einkaufspreis_pro_Kg,
    W.Werkstoffspreis
FROM TAFELN T
JOIN WERKSTOFF W ON T.Werkstoff_ID = W.ID_Werkstoff
WHERE T.Einkauf_Kg > 50;

-- 9. Abfrage: Artikel und deren Marge je Arbeitsschritt
-- Zweck: Deckungsbeitragsrechnung pro Arbeitsschritt am Artikel.
SELECT
    ART.Artikeltext,
    AK.Arbeitsschritt,
    ARS.Marge
FROM ARTIKEL_ARBEITSSCHRITT AA
JOIN ARTIKEL ART ON AA.Artikel_ID = ART.ID_Artikel
JOIN ARBEITSSCHRITT ARS ON AA.Arbeitsschritt_ID = ARS.ID_Arbeitsschritt
JOIN ARBEITSSCHRITTKENNUNG AK ON ARS.Arbeitsschrittkennung_ID = AK.ID_Arbeitsschrittkennung
WHERE ARS.Marge LIKE '1%';

-- 10. Abfrage: Übersicht über alle Maschinen mit hohem Verschnitt
-- Zweck: Effizienz-Auswertung der Maschinen, um Werkzeugverschleiß oder Fehlkalibrierungen zu finden.
SELECT
    Maschinenname,
    Bearbeitungstyp,
    Verschnitt
FROM Maschine
WHERE Verschnitt > 2.0;
