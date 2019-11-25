CREATE TABLE  client(codeClient INTEGER PRIMARY KEY, nomClient VARCHAR(20), adresse VARCHAR(50), region INTEGER, libelleRegion VARCHAR(50), dateContact DATE, email VARCHAR(50));
CREATE TABLE  produit(ref VARCHAR(10) PRIMARY KEY, libelleproduit VARCHAR(20),PU INTEGER);
CREATE TABLE  catalogue(categorie INTEGER PRIMARY KEY, libellecategorie VARCHAR(20),famille INTEGER ,libellefamille VARCHAR(10), ref VARCHAR(50), FOREIGN KEY(ref) REFERENCES produit(ref),TVA FLOAT);
CREATE TABLE  commande(numcommande INTEGER PRIMARY KEY, QTE INTEGER,Prix_HT FLOAT,Prix_TTC FLOAT,  codeClient INTEGER, FOREIGN KEY(codeClient) REFERENCES client(codeClient), ref VARCHAR(20), FOREIGN KEY(ref) REFERENCES produit(ref));
CREATE TABLE  employe(codeemploye INTEGER PRIMARY KEY,nom VARCHAR(10),tele INTEGER, numcommande INTEGER, FOREIGN KEY(numcommande) REFERENCES commande(numcommande));
