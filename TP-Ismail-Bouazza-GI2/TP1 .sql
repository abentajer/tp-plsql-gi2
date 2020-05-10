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

INSERT INTO Client VALUES (1,'Bouazza','Ismail',adress(1,'boujarah',12345,'Tetouan'),'27/09/1998','0611223344','m');

INSERT INTO Client VALUES (2,'Bencherifa','Amal',adress(3,'sania',12345,'fnideq'),'28/10/1998','0611223344','f');

INSERT INTO Client VALUES (3,'Mohamed','Mohamed',adress(44,'sedrawiya',12345,'Tetouan'),'29/07/1998','0611223344','m');

INSERT INTO Client VALUES (4,'Fitian','Chaimae',adress(12,'retaha',12345,'Tetouan'),'30/03/1998','0611223344','f');

INSERT INTO Client VALUES (5,'Farih','Mohamed',adress(1,'retaha',1253,'Rabat'),'31/05/1998','0611223344','m');


INSERT INTO PRODUIT VALUES (1,'TV',1900,10);
INSERT INTO PRODUIT VALUES (2,'PC',4000,5);
INSERT INTO PRODUIT VALUES (3,'Ipad',250,20);

SELECT * from Produit;
select c.num, c.nom, c.prenom, c.adresse.num, c.adresse.rue, c.adresse.cp, c.adresse.ville, c.ddn, c.tel, c.genre from client c;

select f.num, f.v_client, f.v_produit, f.qte from facture f;
INSERT INTO facture VALUES (1,2,2,10);