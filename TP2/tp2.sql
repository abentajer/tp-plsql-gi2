DECLARE
	c2_name Filiere.nomfil%type;
	CURSOR c2_Filiere is
	select nomfil from Filiere;

BEGIN
	OPEN  c2_Filiere;
	LOOP
		FETCH c2_Filiere into c2_name ;
			EXIT WHEN  c2_Filiere%notfound;
			dbms_output.put_line(c2_name);
	END LOOP;
	CLOSE c1_produit;
END;
/
DECLARE
	c1_name Electeurs.nom%type;
	CURSOR c1_Electeurs is
	select nom from Electeurs;

BEGIN
	OPEN  c1_Electeurs;
	LOOP
		FETCH c1_Electeurs into c1_name ;
			EXIT WHEN  c1_Electeurs%notfound;
			dbms_output.put_line(c1_name);
	END LOOP;
	CLOSE c1_produit;
END;
/
CREATE SEQUENCE s1_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;
s1_seq.NEXTVAL;
DECLARE
BEGIN
   InsertCommande('889','01/02/2019','oui','4329,00','5040,40','0.15');
END;
/
CREATE OR REPLACE PROCEDURE InsertCommande(
	   p_userid IN commande.code_commande%TYPE,
	   p_username IN commande.date_commande%TYPE,
	   p_createdby IN commande.reglage%TYPE,
	   p_date IN commande.montant_TTC%TYPE
	   taux number(5,2));
IS
BEGIN

  INSERT INTO commande ("code_commande", "date_commande", "reglage", "montant_TTC",) 
  VALUES (p_userid-p_userid*taux, p_username,p_createdby, p_date);

  COMMIT;

END;
DECLARE
BEGIN
   InsertCommande('889','01/02/2019','oui','4329,00','5040,40');
END;
/
CREATE OR REPLACE PROCEDURE InsertCommande(
	   p_userid IN commande.code_commande%TYPE,
	   p_username IN commande.date_commande%TYPE,
	   p_createdby IN commande.reglage%TYPE,
	   p_date IN commande.montant_TTC%TYPE)
IS
BEGIN

  INSERT INTO commande ("code_commande", "date_commande", "reglage", "montant_TTC") 
  VALUES (p_userid, p_username,p_createdby, p_date);

  COMMIT;

END;
set serveroutput on;
DECLARE
 b VARCHAR2(100):='HOUTY';
 c number(10);
BEGIN 
    
   c := totalCommande(b); 
   dbms_output.put_line('Somme des commandes passés par un client : ' || c); 
END;
/
CREATE OR REPLACE FUNCTION totalCommande(n in VARCHAR2)
RETURN number IS 
   total number(10) := 0; 
BEGIN 
   SELECT count(commande.montant_ttc) into total 
   FROM commande , client
    where commande.code_commande = client.code_commande and client.nom=n
    group by client.nom;
   RETURN total; 
END;


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
TVA NUMBER(5)
);
CREATE TABLE catalogue(
id NUMBER(3) PRIMARY KEY,
nom VARCHAR2(100) NOT NULL,
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













DECLARE
c number(2);
CREATE OR REPLACE FUNCTION totalCommande(id_client IN NUMBER)
RETURN number IS 
   total number(2) := 0; 
BEGIN 
   SELECT SUM(prix) into total 
   FROM commande; 
    
   RETURN total; 
END; 
BEGIN 
   c := totalCommande(son nom); 
   dbms_output.put_line('Total des achat : ' || c); 
END; 
/