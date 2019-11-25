CREATE TABLE employe (
    employe_pk VARCHAR2(6) PRIMARY key,
    nom VARCHAR2(20),
    prenom VARCHAR2(20));
CREATE TABLE region (
    region_pk VARCHAR2(6) PRIMARY KEY,
    libelle VARCHAR2(60));
 CREATE TABLE client (
   client_pk VARCHAR2(6) PRIMARY KEY,
    nom VARCHAR2(40),
    adresse VARCHAR2(50),
    date_contact DATE,
    email VARCHAR2(30),
    observation VARCHAR(250),
    id_reg VARCHAR2(6),
   FOREIGN KEY (id_reg) REFERENCES region(region_pk));
CREATE TABLE commande( 
    commande_pk VARCHAR2(20) PRIMARY KEY,
   date_jour DATE,
   etat VARCHAR2(8),
   id_emp VARCHAR2(6),
   id_client VARCHAR2(6),
  FOREIGN KEY (id_client) REFERENCES client(client_pk),
  FOREIGN KEY (id_emp) REFERENCES employe(employe_pk));
CREATE TABLE famille (
    famille_pk VARCHAR2(6) PRIMARY KEY,
    libelle VARCHAR2(40));
CREATE TABLE categorie (
    categorie_pk VARCHAR2(6) PRIMARY KEY,
    libelle VARCHAR2(40));
  

CREATE TABLE produit (
   produit_pk VARCHAR2(6) PRIMARY KEY,
    libelle VARCHAR2(60),
    pu NUMBER(10),
    tva NUMBER(3),
    id_categ VARCHAR2(6),
    id_famille VARCHAR(6),
FOREIGN KEY (id_categ) REFERENCES categorie(categorie_pk),
FOREIGN KEY (id_famille) REFERENCES famille(famille_pk));
CREATE TABLE concerne (
    qte NUMBER(5),
    id_cmd VARCHAR2(20),
    id_prd VARCHAR2(6),
    PRIMARY KEY (id_cmd, id_prd),
 FOREIGN KEY (id_cmd) REFERENCES commande(commande_pk),
   FOREIGN KEY (id_prd) REFERENCES produit(produit_pk));
