CREATE TABLE RegionClient(
Code_region INT PRIMARY KEY NOT NULL,
libelle VARCHAR(30)
);

CREATE TABLE Client (
code_client INT PRIMARY KEY NOT NULL,
nom VARCHAR(30),
adresse VARCHAR(100),
region INT REFERENCES RegionClient(code_region),
date_contact DATE,
email VARCHAR(50)
);

CREATE TABLE CategorieProduit(
Code_categorie INT PRIMARY KEY NOT NULL,
libelle VARCHAR(30)
);

CREATE TABLE FamilleProduit(
Code_famille INT PRIMARY KEY NOT NULL,
libelle VARCHAR(30)
);

CREATE TABLE Produit (
ref_produit VARCHAR(30) PRIMARY KEY NOT NULL ,
libelle VARCHAR(100),
famille INT REFRENCES FamilleProduit(code_famille),
categorie INT REFRENCES CategorieProduit(code_categorie),
pu INT NOT NULL,
tva INT NOT NULL
);

CREATE TABLE Commande (
ref_commande VARCHAR(30) PRIMARY KEY NOT NULL,
date_commande DATE,
code_client INT REFERENCES Client(code_client),
reglement VARCHAR(5),
qte INT NOT NULL
);

CREATE TABLE DetailCommande (
ref_commande VARCHAR(30) REFERENCES Commande(ref_commande),
ref_produit VARCHAR(30) REFERENCES Produit(ref_produit),
prix_HT NUMBER(10,2),
prix_TTC NUMBER(10,2),
montant_HT NUMBER(20,2),
montant_TTC NUMBER (20,2)
);












