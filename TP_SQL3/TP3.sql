SET SERVEROUTPUT ON;

--Question 1:

CREATE OR REPLACE TYPE T_PERSONNE AS OBJECT (
    Nom VARCHAR2(30),
    Prenom VARCHAR2(30),
    MEMBER FUNCTION InfoPersonne RETURN VARCHAR2
)
NOT FINAL;
/
CREATE OR REPLACE TYPE BODY T_PERSONNE IS
    MEMBER FUNCTION InfoPersonne RETURN VARCHAR2 IS
    BEGIN
        RETURN 'Nom: ' ||Nom|| ' || Prenom: ' ||Prenom;
    END InfoPersonne;
END;
/


CREATE OR REPLACE TYPE T_BUREAU AS OBJECT (
    Centre VARCHAR2(30),
    Etage NUMBER(3),
    Batiment VARCHAR2(30),
    Num NUMBER(3)
);
/
CREATE TYPE T_COURS AS OBJECT (
    Libelle VARCHAR2(30),
    Code VARCHAR2(30),
    Type VARCHAR2(2),
    Semestre NUMBER(2)
);
/


CREATE TYPE cours_l AS TABLE OF T_COURS;
/


CREATE OR REPLACE TYPE T_PROFESSEUR UNDER T_PERSONNE (
    Bureau T_BUREAU,
    listCours cours_l,
    OVERRIDING MEMBER FUNCTION InfoPersonne RETURN VARCHAR2
);
/
CREATE OR REPLACE TYPE BODY T_PROFESSEUR IS
    OVERRIDING MEMBER FUNCTION InfoPersonne RETURN VARCHAR2 IS
    BEGIN
        RETURN (SELF AS T_PERSONNE).InfoPersonne ||' || Centre: ' ||Bureau.Centre|| ' || Etage:  ' ||Bureau.Etage|| ' || Batiment: ' ||Bureau.Batiment|| ' || Numero: ' ||Bureau.Num;
    END InfoPersonne;
END;
/

--Question 2:

CREATE TABLE Professeur OF T_PROFESSEUR NESTED TABLE listCours STORE AS listCours_nt;
/

--Question 3:

INSERT INTO pp VALUES('Outiti','Ayoub',T_b('Centre A',1,'Batiment 1',5),cours_l(T_COURS('BASE DE DONNEE','BD','C',2),T_COURS('PLSQL','BD','TP',4)));
INSERT INTO pp VALUES('talbi','Youssef,T_b('Centre A',1,'Batiment 1',9),cours_l(T_COURS('BASE DE DONNEE','BD','TD',4)));
INSERT INTO pp VALUES('Mohamed','Mohamed',T_b('Centre A',1,'Batiment 1',10),cours_l(T_COURS('BASE DE DONNEE','BD','TP',3),T_COURS('JAVA','JV','TP',3)));
INSERT INTO pp VALUES('Hakymi','Achraf',T_b('Centre B',2,'Batiment 2',17),cours_l(T_COURS('WEB AVANCEE','PWA','C',3)));
INSERT INTO pp VALUES('Zhar','Nabil',T_b('Centre B',2,'Batiment 2',15),cours_l(T_COURS('WEB AVANCEE','PWA','TD',3)));

/

--Question 4:

SELECT p.InfoPersonne() FROM Professeur p, TABLE(p.listCours) c WHERE c.Libelle = 'BASE DE DONNEE' AND c.Type = 'C';
/

--Question 6:

SELECT p.Nom, p.Prenom, CURSOR(SELECT * FROM TABLE(p.listCours)) FROM Professeur p WHERE p.Prenom = 'Ismail';
/

---Question 7:

SELECT p.Nom, p.Prenom, CURSOR(SELECT * FROM TABLE(p.listeCours) c) FROM Professeur p WHERE p.Prenom = 'Mohamed' GROUP BY c.Semestre;