import csv
import xml.etree.ElementTree as ET

input_file = "data/users.csv"
output_file = "data/users.xml"

users = ET.Element("users")

with open(input_file, "r", encoding="utf-8") as file:
    reader = csv.DictReader(file, delimiter=",")

    for row in reader:
        user = ET.SubElement(users, "user")

        ET.SubElement(user, "id").text = row["id"]
        ET.SubElement(user, "username").text = row["username"]
        ET.SubElement(user, "email").text = row["email"]
        ET.SubElement(user, "firstname").text = row["firstname"]
        ET.SubElement(user, "lastname").text = row["lastname"]
        ET.SubElement(user, "idnumber").text = row["idnumber"]
        ET.SubElement(user, "password").text = row["password"]
        ET.SubElement(user, "city").text = row["city"]
        ET.SubElement(user, "country").text = row["country"]

tree = ET.ElementTree(users)

ET.indent(tree, space="    ")

tree.write(output_file, encoding="utf-8", xml_declaration=True)

print("XML file created successfully:", output_file)