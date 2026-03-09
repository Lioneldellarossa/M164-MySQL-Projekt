USE `INF2025G-M164-Lionel_Joel-Lagerverwaltung`;

LOAD DATA INFILE 'C:/Daten/CSV/KUNDE.csv' INTO TABLE KUNDE FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Kunde, Kundenname, Kundennummer, Versandzone);
LOAD DATA INFILE 'C:/Daten/CSV/WERKSTOFF.csv' INTO TABLE WERKSTOFF FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Werkstoff, Werkstoff, Werkstofftyp, Werkstoffspreis, Dichte);
LOAD DATA INFILE 'C:/Daten/CSV/TAFELN.csv' INTO TABLE TAFELN FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Tafel, TafelLänge, TafelBreite, Dicke, Einkauf_Kg, Gedreht, Werkstoff_ID);
LOAD DATA INFILE 'C:/Daten/CSV/AUFTRAG.csv' INTO TABLE AUFTRAG FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Angebot, Angebot, Date, Ges_Preis, Ges_Zeit, ErstelltVon, Kunde_ID);
LOAD DATA INFILE 'C:/Daten/CSV/Maschine.csv' INTO TABLE Maschine FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Maschine, Maschinenname, Bearbeitungstyp, Verschnitt, Vorschub, AbdampfenVorschub, Abdampfen);
LOAD DATA INFILE 'C:/Daten/CSV/ARBEITSSCHRITTKENNUNG.csv' INTO TABLE ARBEITSSCHRITTKENNUNG FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Arbeitsschrittkennung, Arbeitsschritt, Kuerzel, Maschine_ID);
LOAD DATA INFILE 'C:/Daten/CSV/ARBEITSSCHRITT.csv' INTO TABLE ARBEITSSCHRITT FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Arbeitsschritt, Ruesten, Bearbeitungszeit, Gesamtzeit, Marge, StundensatzRuesten, StundensatzOperation, Arbeitsschrittkennung_ID);
LOAD DATA INFILE 'C:/Daten/CSV/ARTIKEL.csv' INTO TABLE ARTIKEL FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Artikel, Artikelnummer, Pos, BenötigteTafeln, Menge, Artikeltext, Stückpreis, Ben_Fläche, Gewicht, Umfang, Länge, Breite, Symmetrie, Bild, Kommentar, Params, Angebot_ID, Tafel_ID);
LOAD DATA INFILE 'C:/Daten/CSV/ARTIKEL_ARBEITSSCHRITT.csv' INTO TABLE ARTIKEL_ARBEITSSCHRITT FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (ID_Artikel_Arbeitsschritt, Artikel_ID, Arbeitsschritt_ID);
LOAD DATA INFILE 'C:/Daten/CSV/ARTIKEL_TAFELN_MM.csv' INTO TABLE ARTIKEL_TAFELN_MM FIELDS TERMINATED BY ';' ENCLOSED BY '"' LINES TERMINATED BY '\n' (Artikel_ID, Tafel_ID);
