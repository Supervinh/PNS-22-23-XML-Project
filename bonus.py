import xml.etree.ElementTree as ET
import xml.dom.minidom

# Charger le fichier XML
tree = ET.parse("projet.xml")
root = tree.getroot()

# Initialiser les variables
sejours_par_type = {}
total_clients = 0

# Compter le nombre de clients pour chaque type de séjour
for sejour in root.findall("./sejours/sejour"):
    type_sejour = sejour.attrib["typeSejour"]
    clients = sejour.findall("./clients/client")
    nb_clients = len(clients)
    total_clients += nb_clients

    if type_sejour in sejours_par_type:
        sejours_par_type[type_sejour] += nb_clients
    else:
        sejours_par_type[type_sejour] = nb_clients

# Calculer le nombre moyen de clients par type de séjour
nb_types_sejour = len(sejours_par_type)
if nb_types_sejour > 0:
    nb_clients_moyen = total_clients // nb_types_sejour
else:
    nb_clients_moyen = 0

# Créer l'élément racine
html = ET.Element("html")

# Créer les sous-éléments et leurs attributs
head = ET.SubElement(html, "head")
meta = ET.SubElement(head, "meta")
meta.set("http-equiv", "Content-Type")
meta.set("content", "text/html")
meta.set("charset", "UTF-8")
title = ET.SubElement(head, "title")
title.text = "Résumé des séjours par type"
link = ET.SubElement(head, "link")
link.set("rel", "stylesheet")
link.set("type", "text/css")
link.set("href", "scenario2.css")

body = ET.SubElement(html, "body")
h1 = ET.SubElement(body, "h1")
h1.text = "Résumé des séjours par type"

table = ET.SubElement(body, "table")
tr = ET.SubElement(table, "tr")
th1 = ET.SubElement(tr, "th")
th1.text = "Type de séjour"
th2 = ET.SubElement(tr, "th")
th2.text = "Nombre de clients"

# Ajouter les données de chaque type de séjour
for type_sejour, nb_clients in sorted(sejours_par_type.items()):
    tr = ET.SubElement(table, "tr")
    td1 = ET.SubElement(tr, "td")
    td1.text = type_sejour
    td2 = ET.SubElement(tr, "td")
    td2.text = str(nb_clients)

# Ajouter le nombre total de clients
tr = ET.SubElement(table, "tr")
th1 = ET.SubElement(tr, "th")
th1.text = "Nombre total de clients"
td1 = ET.SubElement(tr, "td")
td1.text = str(total_clients)

# Ajouter le nombre moyen de clients par type de séjour
tr = ET.SubElement(table, "tr")
th1 = ET.SubElement(tr, "th")
th1.text = "Nombre moyen de clients par type de séjour"
td1 = ET.SubElement(tr, "td")
td1.text = str(nb_clients_moyen)

# Formater et enregistrer le résultat dans un fichier HTML
xml_string = ET.tostring(html, encoding="UTF-8")
xml_pretty_string = xml.dom.minidom.parseString(xml_string).toprettyxml()

with open("bonus.html", "w", encoding="UTF-8") as f:
    f.write(xml_pretty_string)
