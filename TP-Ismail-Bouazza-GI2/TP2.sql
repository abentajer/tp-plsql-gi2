SET SERVEROUTPUT ON;

Create or replace type T_ADRESSAGE as object (
	IP varchar2(15),
	DNS varchar2(100),
    	MEMBER FUNCTION getDNS return VARCHAR2  
);

CREATE TYPE BODY T_ADRESSAGE IS
    MEMBER FUNCTION getDNS return VARCHAR2 IS
        BEGIN
            return DNS  ;
        END;
END;

DESC T_ADRESSAGE;

Create type T_LOCALISATION as object (
	Campus varchar(50),
	Batiment varchar(20),
    	Salle number(3),
    	MEMBER FUNCTION getCampus return VARCHAR2 
);

create type body T_LOCALISATION IS
    MEMBER FUNCTION getCampus return VARCHAR2 IS
        BEGIN
            return Campus ;
        END;
END;

DESC T_LOCALISATION;

create table serveur(
	NumServ number,
	Adressage T_Adressage,
	Localisation T_Localisation);

DESC serveur;
	
INSERT INTO serveur VALUES (0, T_Adressage('158.84.143.204','www.ensa-tetouan.ac.ma'), T_Localisation('Salle Calcule 2','A',1));
INSERT INTO serveur VALUES (1, T_Adressage('158.84.143.120','TP1.ensa-tetouan.ac.ma'), T_Localisation('Salle Calcule 1','L',4));
INSERT INTO serveur VALUES (2, T_Adressage('158.84.143.249','bdb.ensa-tetouan.ac.ma'), T_Localisation('Salle Calcule 1','L',9));
INSERT INTO serveur VALUES (3, T_Adressage('158.84.143.252','dis.ensa-tetouan.ac.ma'), T_Localisation('Salle Calcule 1','L',4));
INSERT INTO serveur VALUES (4, T_Adressage('158.84.143.251','diserv.ensa-tetouan.ac.ma'), T_Localisation('Salle Calcule 1','L',4));
INSERT INTO serveur VALUES (5, T_Adressage('158.84.143.250','disora.ensa-tetouan.ac.ma'), T_Localisation('Salle Calcule 1','L',12));

select * from serveur;

select s.Adressage.DNS, s.Localisation.Campus from serveur s;

select s.Adressage.DNS, s.Adressage.IP from serveur s where s.localisation.Campus = 'Salle Calcule 1';

SELECT s.Localisation.Salle, COUNT(NumServ) FROM serveur s WHERE s.Localisation.Batiment='L' GROUP BY s.Localisation.Salle;

CREATE TYPE T_ADMINISTRATEUR AS OBJECT(
    NumAdm NUMBER,
    Non VARCHAR2(20) ,
    NumPoste Number
)NOT FINAL;

create table ADMINISTRATEUR of T_ADMINISTRATEUR;

DESC ADMINISTRATEUR;

INSERT INTO ADMINISTRATEUR VALUES (0, 'NOM1', 3131);
INSERT INTO ADMINISTRATEUR VALUES (1, 'NOM2', 4403);

SELECT * FROM ADMINISTRATEUR;

SELECT VALUE(a) FROM ADMINISTRATEUR a;

DECLARE
    a T_ADMINISTRATEUR;
    BEGIN
    a:= T_ADMINISTRATEUR(3,'BOUAZZA',5151);
    dbms_output.put_line('NumAdm : ' || a.NumAdm || ' ,Nom: ' || a.Non || ' ,NumPoste: ' || a.NumPoste);
    INSERT INTO ADMINISTRATEUR VALUES a;
END;