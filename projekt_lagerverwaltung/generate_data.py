import csv
import random
from datetime import datetime, timedelta

def generate_kunde():
    with open('KUNDE.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        names = ["Müller GmbH", "Schmidt KG", "Bäcker & Sohn", "Weber AG", "Meyer und Co",
                 "Hoffmann Logistics", "Wagner Produktion", "Becker Industrie", "Schulz Services", "Klein Metallbau"]
        zones = ["Standard", "Express", "International", "Standard", "Standard", "Express", "Standard", "Standard", "International", "Express"]
        for i in range(1, 11):
            writer.writerow([i, names[i-1], 1000 + i, zones[i-1]])

def generate_werkstoff():
    with open('WERKSTOFF.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        stoffe = ["Aluminium", "Stahl", "Edelstahl", "Kupfer", "Messing", "Kunststoff", "Titan", "Holz", "Carbon", "Glas"]
        typen = ["AlMg3", "S235JR", "V2A", "Cu-ETP", "CuZn39Pb3", "POM", "Ti6Al4V", "MDF", "CFK", "Sicherheitsglas"]
        for i in range(1, 11):
            writer.writerow([i, stoffe[i-1], typen[i-1], round(random.uniform(5.0, 50.0), 2), round(random.uniform(1.2, 8.0), 2)])

def generate_tafeln():
    with open('TAFELN.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        for i in range(1, 11):
            laenge = random.choice([1000, 2000, 3000, 1500])
            breite = random.choice([500, 1000, 1250, 1500])
            dicke = random.choice([2, 5, 10, 15, 20])
            einkauf_kg = round(random.uniform(10.0, 100.0), 2)
            gedreht = round(random.uniform(0.0, 1.0), 2)
            werkstoff_id = random.randint(1, 10)
            writer.writerow([i, laenge, breite, dicke, einkauf_kg, gedreht, werkstoff_id])

def generate_auftrag():
    with open('AUFTRAG.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        angebote = ["ANG-001", "ANG-002", "ANG-003", "ANG-004", "ANG-005", "ANG-006", "ANG-007", "ANG-008", "ANG-009", "ANG-010"]
        ersteller = ["Müller", "Schmidt", "Meier", "Müller", "Schmidt", "Müller", "Meier", "Müller", "Schmidt", "Meier"]
        base_date = datetime(2023, 1, 1)
        for i in range(1, 11):
            date_str = (base_date + timedelta(days=random.randint(1, 300))).strftime('%Y-%m-%d %H:%M:%S')
            ges_preis = round(random.uniform(100.0, 5000.0), 2)
            ges_zeit = f"{random.randint(1,8):02d}:00:00"
            kunde_id = random.randint(1, 10)
            writer.writerow([i, angebote[i-1], date_str, ges_preis, ges_zeit, ersteller[i-1], kunde_id])

def generate_maschine():
    with open('Maschine.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        namen = ["Fräse 1", "Fräse 2", "Drehbank", "Laser", "Wasserstrahl", "Kantbank", "Bohrmaschine", "Säge", "Schweißroboter", "Schleifmaschine"]
        typen = ["Fräsen", "Fräsen", "Drehen", "Laserschneiden", "Wasserstrahlschneiden", "Kanten", "Bohren", "Sägen", "Schweißen", "Schleifen"]
        for i in range(1, 11):
            verschnitt = round(random.uniform(1.0, 10.0), 2)
            vorschub = f"{random.randint(10,50)}%"
            abd_vorschub = random.randint(100, 500)
            abd = random.randint(10, 50)
            writer.writerow([i, namen[i-1], typen[i-1], verschnitt, vorschub, abd_vorschub, abd])

def generate_arbeitsschrittkennung():
    with open('ARBEITSSCHRITTKENNUNG.csv', 'w', newline='', encoding='utf-8') as f:
        # Don't use standard CSV writer for this file to avoid quoting '\N'
        # MariaDB expects exactly \N for NULL when using LOAD DATA INFILE
        schritte = ["Grobschnitt", "Feinschnitt", "Bohrung", "Gewinde", "Fasen", "Entgraten", "Schleifen", "Polieren", "Lackieren", "Montage"]
        kuerzel = ["GR", "FE", "BO", "GE", "FA", "EN", "SC", "PO", "LA", "MO"]
        for i in range(1, 11):
            maschine_id = random.randint(1, 10) if random.random() > 0.2 else "\\N"
            f.write(f'"{i}";"{schritte[i-1]}";"{kuerzel[i-1]}";{maschine_id}\n')

def generate_arbeitsschritt():
    with open('ARBEITSSCHRITT.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        for i in range(1, 11):
            ruesten = f"00:{random.randint(5,30):02d}:00"
            bearbeiten = f"0{random.randint(1,3)}:{random.randint(0,59):02d}:00"
            gesamt = bearbeiten
            marge = f"{random.randint(5,20)}%"
            std_ruesten = round(random.uniform(50.0, 100.0), 2)
            std_op = round(random.uniform(60.0, 150.0), 2)
            kennung_id = i
            writer.writerow([i, ruesten, bearbeiten, gesamt, marge, std_ruesten, std_op, kennung_id])

def generate_artikel():
    with open('ARTIKEL.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        texte = ["Grundplatte", "Halterung", "Gehäuse", "Deckel", "Welle", "Bolzen", "Rad", "Achse", "Zahnrad", "Hebel"]
        for i in range(1, 11):
            artnr = f"ART-{1000+i}"
            pos = i
            ben_tafeln = random.randint(1, 5)
            menge = random.randint(10, 100)
            text = texte[i-1]
            preis = round(random.uniform(5.0, 500.0), 2)
            flaeche = round(random.uniform(0.1, 5.0), 2)
            gewicht = round(random.uniform(0.1, 20.0), 2)
            umfang = random.randint(10, 200)
            laenge = random.randint(50, 1000)
            breite = random.randint(50, 500)
            sym = random.randint(0, 1)
            bild = f"bild_{i}.png"
            kommentar = "Standardartikel"
            params = "N/A"
            angebot_id = random.randint(1, 10)
            tafel_id = random.randint(1, 10)
            writer.writerow([i, artnr, pos, ben_tafeln, menge, text, preis, flaeche, gewicht, umfang, laenge, breite, sym, bild, kommentar, params, angebot_id, tafel_id])

def generate_artikel_arbeitsschritt():
    with open('ARTIKEL_ARBEITSSCHRITT.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        count = 1
        for art_id in range(1, 11):
            schritte = random.sample(range(1, 11), random.randint(1, 3))
            for schritt_id in schritte:
                writer.writerow([count, art_id, schritt_id])
                count += 1

def generate_artikel_tafeln_mm():
    with open('ARTIKEL_TAFELN_MM.csv', 'w', newline='', encoding='utf-8') as f:
        writer = csv.writer(f, delimiter=';', quotechar='"')
        for art_id in range(1, 11):
            tafeln = random.sample(range(1, 11), random.randint(1, 2))
            for tafel_id in tafeln:
                writer.writerow([art_id, tafel_id])

generate_kunde()
generate_werkstoff()
generate_tafeln()
generate_auftrag()
generate_maschine()
generate_arbeitsschrittkennung()
generate_arbeitsschritt()
generate_artikel()
generate_artikel_arbeitsschritt()
generate_artikel_tafeln_mm()
