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

INSERT INTO Client VALUES (1,'outiti','ayoub',adress(1,'mhannech',12345,'Tetouan'),'22/09/1997','0611223344','m');

INSERT INTO Client VALUES (2,'outiti','arafa',adress(2,'lirak',12345,'fes'),'10/10/1997','0611223344','m');

INSERT INTO Client VALUES (3,'layachi','hamza',adress(4,'narjis',125,'fes'),'2/05/1995','0611223344','m');

INSERT INTO Client VALUES (4,'talbi','youssef',adress(1666,'slougui',15,'Meknes'),'3/3/1990','0611223344','m');

INSERT INTO Client VALUES (5,'Farih','Mohamed',adress(1,'retaha',1253,'Rabat'),'31/05/1998','0611223344','m');


INSERT INTO PRODUIT VALUES (1,'TV',1900,10);
INSERT INTO PRODUIT VALUES (2,'PC',4000,5);
INSERT INTO PRODUIT VALUES (3,'Ipad',250,20);

SELECT * from Produit;
select c.num, c.nom, c.prenom, c.adresse.num, c.adresse.rue, c.adresse.cp, c.adresse.ville, c.ddn, c.tel, c.genre from client c;

select f.num, f.v_client, f.v_produit, f.qte from facture f;
INSERT INTO facture VALUES (1,2,2,10);