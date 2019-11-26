/* creation des tables */

CREATE TABLE commande(
code_commande NUMBER(5) PRIMARY KEY,
date_commande VARCHAR2(100) NOT NULL,
reglage VARCHAR(3),
montant_HT NUMBER(8),
montant_TTC NUMBER(8)
);
CREATE TABLE client(
code_client NUMBER(5) PRIMARY KEY,
nom VARCHAR2(100) NOT NULL,
adresse VARCHAR2(100),
email VARCHAR2(100),
date_de_contact DATE ,
code_commande NUMBER(5),
CONSTRAINT fk_codecommande
    FOREIGN KEY (code_commande)
    REFERENCES commande(code_commande)
);
CREATE TABLE region(
code_region NUMBER(5) PRIMARY KEY,
libelle VARCHAR(100),
code_client NUMBER(5),
CONSTRAINT fk_codeclient
    FOREIGN KEY (code_client)
    REFERENCES client(code_client)
);
CREATE TABLE produit(
ref VARCHAR(5) PRIMARY KEY,
libelle VARCHAR2(100) NOT NULL,
PU NUMBER(5),
TVA VARCHAR2(10)
);
CREATE TABLE catalogue(
id NUMBER(3) PRIMARY KEY,
code_client NUMBER(5),
ref VARCHAR(5),
CONSTRAINT fk_codeclient1
    FOREIGN KEY (code_client)
    REFERENCES client(code_client),
CONSTRAINT fk_ref1
    FOREIGN KEY (ref)
    REFERENCES produit(ref)
);
CREATE TABLE concerne(
quantite NUMBER(3),
code_commande NUMBER(5),
CONSTRAINT fk_codecommande1
    FOREIGN KEY (code_commande)
    REFERENCES commande(code_commande),
ref VARCHAR(5),
CONSTRAINT fk_ref2
    FOREIGN KEY (ref)
    REFERENCES produit(ref)
);
CREATE TABLE famille(
code_famille NUMBER(5) PRIMARY KEY,
libelle VARCHAR2(100) NOT NULL,
ref VARCHAR(5),
CONSTRAINT fk_ref4
    FOREIGN KEY (ref)
    REFERENCES produit(ref)
);
CREATE TABLE categorie(
code_categorie NUMBER(5) PRIMARY KEY,
libelle VARCHAR2(100) NOT NULL,
ref VARCHAR(5),
CONSTRAINT fk_ref3
    FOREIGN KEY (ref)
    REFERENCES produit(ref)
);