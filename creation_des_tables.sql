/* creation des tables */

CREATE TABLE CLIENT(
    Code_client NUMBER PRIMARY KEY,
    Nom VARCHAR2(30) NOT NULL,
    Adresse VARCHAR2(100) NOT NULL,
    Email VARCHAR2(30) NOT NULL,
    Date_Contact DATE NOT NULL,
    Code_region NUMBER, 
        FOREIGN KEY (Code_region) 
        REFERENCES REGION(Code_region));

CREATE TABLE REGION(
    Code_region NUMBER PRIMARY KEY,
    Libelle VARCHAR2(30) NOT NULL);

CREATE TABLE COMMANDE(
    Code_commande NUMBER PRIMARY KEY,
    Date_commande DATE NOT NULL,
    Reglage NUMBER,
    Montant_HT NUMBER ,
    Montant_TTC NUMBER ,
    Code_Client NUMBER,
        FOREIGN KEY (Code_client) 
        REFERENCES CLIENT(Code_client));
    
CREATE TABLE CONTENIR(
    Quantité NUMBER NOT NULL,
    Ref VARCHAR2(20),
    Code_commande NUMBER,
         FOREIGN KEY (Code_commande) 
         REFERENCES COMMANDE (Code_commande),
    FOREIGN KEY(Ref ) 
         REFERENCES PRODUIT(Ref ));
    
CREATE TABLE FAMILLE(
    Code_famille NUMBER PRIMARY KEY,
    Libelle VARCHAR2(30) NOT NULL);

CREATE TABLE CATEGORIE(
    Code_categorie NUMBER PRIMARY KEY,
    Libelle VARCHAR2(100) NOT NULL);


CREATE TABLE PRODUIT(
    Ref VARCHAR2(20) PRIMARY KEY,
    Libelle VARCHAR2(200) NOT NULL,
    PU NUMBER NOT NULL,
    TVA VARCHAR2(20) NOT NULL,
    Code_famille NUMBER,
    Code_categorie NUMBER,
    FOREIGN KEY (Code_famille ) 
         REFERENCES FAMILLE(Code_famille ),
    FOREIGN KEY (Code_categorie) 
         REFERENCES CATEGORIE(Code_categorie));