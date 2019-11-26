//question_un_cursor;
 
SET serveroutput ON;
DECLARE
CURSOR c_prod is
select * from catalogue where Ref='A02';
    prod_rec catalogue%ROWTYPE;
BEGIN
    OPEN c_prod;
        FETCH c_prod INTO prod_rec; 
        DBMS_OUTPUT.PUT_LINE(prod_rec.Ref||prod_rec.libelle||prod_rec.categorie||prod_rec.famille||prod_rec.PU||prod_rec.TVA ) ;
    CLOSE c_prod;
END;


**********
procedure qui insert une ligne ,,,,
CREATE OR REPLACE PROCEDURE InsertCommande(
	   p_userid IN commande.code_commande%TYPE,
	   p_username IN commande.date_commande%TYPE,
	   p_createdby IN commande.reglage%TYPE,
	   p_date IN commande.montant_ttc%TYPE,
        p_date2 IN commande.montant_ht%TYPE)
IS
BEGIN

  INSERT INTO commande (code_commande, date_commande, reglage, montant_ttc,montant_ht) 
  VALUES (p_userid, p_username,p_createdby, p_date,p_date2);
  
  COMMIT;

END ;
/
****
//select * from commande ;
**
DECLARE
BEGIN
  InsertCommande('101','02/02/2019','oui','536','56');
END;
*******************


CREATE OR REPLACE FUNCTION totalCommande(n in VARCHAR2)
RETURN number IS 
   total number(10) := 0; 
BEGIN 
   SELECT count(commande.montant_ttc) into total 
   FROM commande , client
   
    where commande.code_commande = client.code_commande and client.nom=n;
   RETURN total; 
END totalCommande;



**
set serveroutput on;
DECLARE
 b VARCHAR2(100):='ESSEGHIRI';
 c number(10);
BEGIN 
    
   c := totalCommande(b); 
   dbms_output.put_line('Somme des commandes passés par un client : ' || c); 
END;
/
************

CREATE OR REPLACE FUNCTION MINCLIENT
RETURN varchar2 IS 
   total varchar2(100);  
BEGIN 
   
select c INTO  total FROM ( select sum(commande.montant_ttc) as qte , client.nom as c   FROM commande , client
    where commande.code_commande = client.code_commande group by client.nom)order by qte asc  FETCH NEXT 1 ROWS ONLY;
   RETURN total; 
END ;
***
set serveroutput on;
DECLARE
 c VARCHAR2(100);
BEGIN 
   c := MINCLIENT();
   dbms_output.put_line('Somme des commandes passés par un client : ' || c); 
END;
***********
CREATE OR REPLACE FUNCTION MAXCLIENT
RETURN varchar2 IS 
   total varchar2(100);  
BEGIN 
   
select c INTO  total FROM ( select sum(commande.montant_ttc) as qte , client.nom as c   FROM commande , client
    where commande.code_commande = client.code_commande group by client.nom)order by qte desc  FETCH NEXT 1 ROWS ONLY;
   RETURN total; 
END ;
******
CREATE OR REPLACE FUNCTION CONVERTIR(i IN NUMBER, j IN number )
RETURN number IS 
prix number(20);
BEGIN
	select montant_TTC into prix from commande where code_commande=j;
	IF( i=1 ) THEN
   	prix  := prix*11;
    END IF;
	IF(i=2) THEN
	prix  := prix*9;
	END IF;
    RETURN prix;
END;
***
	set serveroutput on;
DECLARE
a number :=2;
b number :=886;
	c number(10,3);
BEGIN
	dbms_output.put_line('1-convertion MAD -> euro'); 
	dbms_output.put_line('2-convertion MAD -> dollar'); 

    	c:=CONVERTIR(a,b);
    	dbms_output.put_line('la convertion mad -> euro donne  : ' || c); 

END;
/
***************














TP2
**********
---tables----
CREATE TABLE filiere(
idfil NUMBER(5) PRIMARY KEY,
nomfil VARCHAR2(100) NOT NULL);
CREATE TABLE electeurs(
idelec NUMBER(10) PRIMARY KEY,
nom VARCHAR2(100) NOT NULL,
pnom VARCHAR2(100),
ddn DATE ,
cand VARCHAR2(100) ,
nvot NUMBER(10)  ,
nvoix NUMBER(10)  ,
idfil NUMBER(5),
CONSTRAINT fk_idfil
    FOREIGN KEY (idfil)
    REFERENCES filiere(idfil));
*************************
INSERT INTO filiere VALUES ('1','Genie informatique GI');
INSERT INTO filiere VALUES ('2','Genie reseaux GSTR');
INSERT INTO filiere VALUES ('3','Genie logistique GL');
INSERT INTO filiere VALUES ('4','Genie mecatronique GM');
INSERT INTO filiere VALUES ('5','Genie civil GC');
**********
INSERT INTO electeurs VALUES ('1','youssef','ouajdi','20/03/2019','oui','100','200','1');
INSERT INTO electeurs VALUES ('2','amine','kacimi','22/03/2019','non','103','20','1');
INSERT INTO electeurs VALUES ('3','donia','ghani','08/07/2019','oui','10','209','1');
INSERT INTO electeurs VALUES ('4','brahim ','nkhili','02/02/2019','oui','106','100','1');
INSERT INTO electeurs VALUES ('5','ayoub','outiti','20/06/2019','non','88','200','1');


INSERT INTO electeurs VALUES ('6','youssef','jourani','30/03/2019','oui','120','26','2');
INSERT INTO electeurs VALUES ('7','hedadi','abderahim','20/09/2019','non','180','55','2');
INSERT INTO electeurs VALUES ('8','chani','hemadi','20/03/2019','oui','20','60','2');
INSERT INTO electeurs VALUES ('9','ayoub ','ouhti','09/12/2019','oui','10','30','2');
INSERT INTO electeurs VALUES ('10','amine','suissii','20/10/2019','non','12','240','2');


INSERT INTO electeurs VALUES ('11','ahmed','bentajer','10/06/2019','oui','0','0','3');
INSERT INTO electeurs VALUES ('12','ali','sibaoui','20/09/2019','non','10','88','3');
INSERT INTO electeurs VALUES ('13','mehdi','jeep','20/08/2019','oui','190','228','3');
INSERT INTO electeurs VALUES ('14','brahim ','nkhili','27/03/2019','oui','88','30','3');
INSERT INTO electeurs VALUES ('15','ayoub','outiti','22/07/2019','non','45','220','3');


INSERT INTO electeurs VALUES ('16','jaber','bouhdidi','19/10/2019','oui','30','230','4');
INSERT INTO electeurs VALUES ('17','yaakoubi ','mohamed','15/04/2019','non','70','209','4');
INSERT INTO electeurs VALUES ('18','youtube','ghin','05/03/2019','oui','80','50','4');
INSERT INTO electeurs VALUES ('19','brahim ','nkhili','30/03/2019','oui','77','90','4');
INSERT INTO  electeurs VALUES ('20','suissine','amin','27/04/2019','non','65','20','4');


INSERT INTO electeurs VALUES ('21','bouhamidi','said','07/05/2019','oui','80','206','5');
INSERT INTO electeurs VALUES ('22','amoun','silva','06/03/2019','non','97','202','5');
INSERT INTO electeurs VALUES ('23','donia','dghoghi','03/08/2019','oui','90','207','5');
INSERT INTO electeurs VALUES ('24','Brahim','diaz','02/09/2019','oui','22','209','5');
INSERT INTO electeurs VALUES ('25','ayoub','outiti','08/06/2019','non','10','205','5');
********************



/
c1_cand%TYPE;
select nom into c1_name from electeurs where cand=true;
select sum(electeurs.nvot) into c5_nvot from electeur e ,filiere f where f.idfil =e.idfl  ;
**************************
QUESTION 1 
**

CREATE SEQUENCE filiere_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE electeurs_seq
  MINVALUE 1
  START WITH 1
  INCREMENT BY 1
  CACHE 30;
***********************
Créer un curseur puis afficher juste la liste des électeurs ;


DECLARE
	c2_name electeurs.nom%type;
	CURSOR c2_Electeurs is
	select nom from electeurs where cand='oui';

BEGIN
	OPEN  c2_Electeurs;
	LOOP
		FETCH c2_Electeurs into c2_name ;
			EXIT WHEN  c2_Electeurs%notfound;
			dbms_output.put_line(c2_name);
	END LOOP;
	CLOSE c2_Electeurs;
END;
Créer un curseur puis afficher les filières ;


DECLARE
	c3_name filiere.nomfil%type;
	CURSOR c3_filiere is
	select nomfil from filiere ;

BEGIN
	OPEN  c3_filiere;
	LOOP
		FETCH c3_filiere into c3_name ;
			EXIT WHEN  c3_filiere%notfound;
			dbms_output.put_line(c3_name);
	END LOOP;
	CLOSE c3_filiere;
END;
**********
--Créer un curseur puis afficher tous les électeurs (candidats et électeurs)
DECLARE
	c4_name electeurs.nom%type;
	CURSOR c4_Electeurs is
	select nom from electeurs;

BEGIN
	OPEN  c4_Electeurs;
	LOOP
		FETCH c4_Electeurs into c4_name ;
			EXIT WHEN  c4_Electeurs%notfound;
			dbms_output.put_line(c4_name);
	END LOOP;
	CLOSE c4_Electeurs;
END;
*********
--Créer un curseur permettant d’afficher le nombre de vote par filière
DECLARE
	c6_nombre NUMBER;
	CURSOR c6_Electeurs is
	select sum(nvot) from electeurs group by idfil;

BEGIN
	OPEN  c6_Electeurs;
	LOOP
		FETCH c6_Electeurs into c6_nombre ;
			EXIT WHEN  c6_Electeurs%notfound;
			dbms_output.put_line(c6_nombre);
	END LOOP;
	CLOSE c6_Electeurs;
END;
*********

--Créer un curseur paramétré permettant d’afficher la liste des candidats d’une filière
DECLARE
	c7_name electeurs.nom%type;
	CURSOR c7_El(c7_idf NUMBER) is
	select nom from electeurs where idfil=c7_idf;

BEGIN
	OPEN  c7_El(2); -- par exemple 2(Genie reseaux GSTR)
	LOOP
		FETCH c7_El into c7_name ;
			EXIT WHEN  c7_El%notfound;
			dbms_output.put_line(c7_name);
	END LOOP;
	CLOSE c7_El;
END;
********

******
procedure:
****
--Créer une procédure pour ajouter les filières
CREATE OR REPLACE PROCEDURE Insertfiliere(
	   p_idfil IN filiere.idfil%TYPE,
	   p_nomfil IN filiere.nomfil%TYPE)
IS
BEGIN

  INSERT INTO filiere (idfil,nomfil) 
  VALUES (p_idfil, p_nomfil);

END ;
/
**
select * from filiere;
DECLARE
BEGIN
  Insertfiliere('6','energie renouvlable ER');
END;
*******
CREATE OR REPLACE PROCEDURE updateelecteurs(
	   p_cand IN electeurs.cand%TYPE :='oui',
	   p_username IN electeurs.nom%TYPE,
	   p_userprenom IN electeurs.pnom%TYPE)
IS
BEGIN

  UPDATE electeurs SET cand = p_cand where  nom = p_username and pnom =p_userprenom;
  
  COMMIT;

END;
/
hadi l update****