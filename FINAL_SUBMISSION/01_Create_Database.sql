CREATE DATABASE IF NOT EXISTS `INF2025G-M164-Lionel_Joel-Lagerverwaltung`;
USE `INF2025G-M164-Lionel_Joel-Lagerverwaltung`;

-- 1. KUNDE
CREATE TABLE KUNDE (
    ID_Kunde INT AUTO_INCREMENT PRIMARY KEY,
    Kundenname VARCHAR(50) NOT NULL,
    Kundennummer INT UNIQUE NOT NULL,
    Versandzone VARCHAR(20) DEFAULT 'Standard'
);

-- 2. WERKSTOFF
CREATE TABLE WERKSTOFF (
    ID_Werkstoff INT AUTO_INCREMENT PRIMARY KEY,
    Werkstoff VARCHAR(25) NOT NULL,
    Werkstofftyp VARCHAR(25) NOT NULL,
    Werkstoffspreis FLOAT CHECK (Werkstoffspreis >= 0),
    Dichte FLOAT CHECK (Dichte > 0)
);

-- 3. TAFELN
CREATE TABLE TAFELN (
    ID_Tafel INT AUTO_INCREMENT PRIMARY KEY,
    TafelLänge INT NOT NULL,
    TafelBreite INT NOT NULL,
    Dicke INT NOT NULL,
    Einkauf_Kg FLOAT,
    Gedreht FLOAT,
    Werkstoff_ID INT NOT NULL,
    CONSTRAINT fk_tafeln_werkstoff FOREIGN KEY (Werkstoff_ID) REFERENCES WERKSTOFF(ID_Werkstoff) ON DELETE CASCADE
);

-- 4. AUFTRAG
CREATE TABLE AUFTRAG (
    ID_Angebot INT AUTO_INCREMENT PRIMARY KEY,
    Angebot VARCHAR(50) NOT NULL,
    Date DATETIME NOT NULL,
    Ges_Preis FLOAT CHECK (Ges_Preis >= 0),
    Ges_Zeit TIME,
    ErstelltVon VARCHAR(50),
    Kunde_ID INT NOT NULL,
    CONSTRAINT fk_auftrag_kunde FOREIGN KEY (Kunde_ID) REFERENCES KUNDE(ID_Kunde) ON DELETE CASCADE
);

-- 5. Maschine
CREATE TABLE Maschine (
    ID_Maschine INT AUTO_INCREMENT PRIMARY KEY,
    Maschinenname VARCHAR(50) NOT NULL,
    Bearbeitungstyp VARCHAR(50) NOT NULL,
    Verschnitt FLOAT,  -- Changed from VARCHAR to FLOAT to reflect percentages appropriately
    Vorschub VARCHAR(5),
    AbdampfenVorschub INT,
    Abdampfen INT
);

-- 6. ARBEITSSCHRITTKENNUNG
CREATE TABLE ARBEITSSCHRITTKENNUNG (
    ID_Arbeitsschrittkennung INT AUTO_INCREMENT PRIMARY KEY,
    Arbeitsschritt VARCHAR(50) NOT NULL,
    Kuerzel VARCHAR(25) UNIQUE NOT NULL,
    Maschine_ID INT, -- Changed to allow NULL (c:m relation: ein Arbeitsschritt kann, muss aber keine Maschine haben)
    CONSTRAINT fk_kennung_maschine FOREIGN KEY (Maschine_ID) REFERENCES Maschine(ID_Maschine) ON DELETE NO ACTION
);

-- 7. ARBEITSSCHRITT
CREATE TABLE ARBEITSSCHRITT (
    ID_Arbeitsschritt INT AUTO_INCREMENT PRIMARY KEY,
    Ruesten TIME,
    Bearbeitungszeit TIME,
    Gesamtzeit TIME,
    Marge VARCHAR(5),
    StundensatzRuesten FLOAT,
    StundensatzOperation FLOAT,
    Arbeitsschrittkennung_ID INT NOT NULL,
    CONSTRAINT fk_schritt_kennung FOREIGN KEY (Arbeitsschrittkennung_ID) REFERENCES ARBEITSSCHRITTKENNUNG(ID_Arbeitsschrittkennung) ON DELETE CASCADE
);

-- 8. ARTIKEL
CREATE TABLE ARTIKEL (
    ID_Artikel INT AUTO_INCREMENT PRIMARY KEY,
    Artikelnummer VARCHAR(100) UNIQUE NOT NULL,
    Pos INT,
    BenötigteTafeln INT,
    Menge INT CHECK (Menge > 0),
    Artikeltext VARCHAR(100),
    Stückpreis FLOAT CHECK (Stückpreis >= 0),
    Ben_Fläche FLOAT,
    Gewicht FLOAT,
    Umfang INT,
    Länge INT,
    Breite INT,
    Symmetrie INT,
    Bild VARCHAR(255),
    Kommentar TEXT,
    Params VARCHAR(100),
    Angebot_ID INT NOT NULL,
    Tafel_ID INT NOT NULL,
    CONSTRAINT fk_artikel_angebot FOREIGN KEY (Angebot_ID) REFERENCES AUFTRAG(ID_Angebot) ON DELETE CASCADE,
    CONSTRAINT fk_artikel_tafel FOREIGN KEY (Tafel_ID) REFERENCES TAFELN(ID_Tafel) ON DELETE NO ACTION
);

-- 9. ARTIKEL_ARBEITSSCHRITT
CREATE TABLE ARTIKEL_ARBEITSSCHRITT (
    ID_Artikel_Arbeitsschritt INT AUTO_INCREMENT PRIMARY KEY,
    Artikel_ID INT NOT NULL,
    Arbeitsschritt_ID INT NOT NULL,
    CONSTRAINT fk_art_arb_artikel FOREIGN KEY (Artikel_ID) REFERENCES ARTIKEL(ID_Artikel) ON DELETE CASCADE,
    CONSTRAINT fk_art_arb_schritt FOREIGN KEY (Arbeitsschritt_ID) REFERENCES ARBEITSSCHRITT(ID_Arbeitsschritt) ON DELETE CASCADE
);

-- Additional M:M table to satisfy the "mind. 2 m:m-Beziehungen, mind 1 ohne Attribute im ERM"
-- 10. ARTIKEL_TAFELN (M:M between ARTIKEL and TAFELN, assuming an article can be made from multiple boards and a board can be used for multiple articles)
CREATE TABLE ARTIKEL_TAFELN_MM (
    Artikel_ID INT NOT NULL,
    Tafel_ID INT NOT NULL,
    PRIMARY KEY (Artikel_ID, Tafel_ID),
    CONSTRAINT fk_mm_artikel FOREIGN KEY (Artikel_ID) REFERENCES ARTIKEL(ID_Artikel) ON DELETE CASCADE,
    CONSTRAINT fk_mm_tafel FOREIGN KEY (Tafel_ID) REFERENCES TAFELN(ID_Tafel) ON DELETE CASCADE
);
