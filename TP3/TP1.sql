SET SERVEROUTPUT ON;

Create type adress as object (
	num number,
	rue varchar2(25),
	cp number,
	ville varchar2(25),
	member function Afficher return VARCHAR2
);
/

Create or replace Type Body adress IS
	member function Afficher return varchar IS
	BEGIN
		return num ||' '|| rue||' '||cp||' '||ville;
	END;
END;

CREATE Table Client (
	num number PRIMARY KEY NOT NULL,
	nom varchar2(25),
	prenom varchar2(25),
	adresse adress,
	ddn DATE,
	tel varchar2(10),
	genre varchar2(2)

);

CREATE TABLE PRODUIT (
	num number PRIMARY KEY NOT NULL,
	designation varchar2(25),
	prix FLOAT,
	stock number
);

CREATE TABLE Facture(
	num number PRIMARY KEY,
	v_client number,
	v_produit number,
	qte number,
	FOREIGN KEY (v_client) REFERENCES Client(num),
	FOREIGN KEY (v_produit) REFERENCES PRODUIT(num)
);


SELECT * from Produit;
select c.num, c.nom, c.prenom, c.adresse.num, c.adresse.rue, c.adresse.cp, c.adresse.ville, c.ddn, c.tel, c.genre from client c;

select f.num, f.v_client, f.v_produit, f.qte from facture f;