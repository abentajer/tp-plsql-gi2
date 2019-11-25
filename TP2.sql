/************CREATION DES TABLES POUR TESTER*************/
CREATE TABLE Filiere (id_fil VARCHAR2(15) PRIMARY KEY,nom_fil VARCHAR2(20));
CREATE TABLE Electeurs ( idelec VARCHAR2(15) PRIMARY KEY, nom VARCHAR2(15), pnom VARCHAR2(15), ddn DATE, nvot NUMBER, nvoix NUMBER, cand VARCHAR2(15), idf VARCHAR2(15) REFERENCES Filiere(id_fil));
/*****************INSERTION POUR TESTER*************************************/
INSERT INTO Filiere VALUES('1','2AP1');
INSERT INTO Filiere VALUES('2','2AP2');
INSERT INTO Filiere VALUES('3','GI');
INSERT INTO Filiere VALUES('4','GSTR');
INSERT INTO Filiere VALUES('5','GM');
INSERT INTO Filiere VALUES('6','SCM');
INSERT INTO Filiere VALUES('7','GC');
/***********************INSERTION POUR TESTER**********************************/
INSERT INTO Electeurs VALUES ('1','Mohamed','Moufid','12/JAN/1998',3,20,'oui','7');
INSERT INTO Electeurs VALUES ('2','Taha','Morabet','12/04/1998',6,3,'oui','7');
INSERT INTO Electeurs VALUES ('3','Mounir','Hadad','12/05/1996',3,0,'non','7');
INSERT INTO Electeurs VALUES ('4','Mahmoud','adil','12/09/1998',6,24,'oui','1');
INSERT INTO Electeurs VALUES ('5','Anas','Tahiri','12/11/1998',4,10,'oui','1');
INSERT INTO Electeurs VALUES ('6','Nissrine','EL ayat','12/12/1998',9,5,'oui','3');
INSERT INTO Electeurs VALUES ('7','Adil','tahiri','12/09/1998',7,28,'oui','3');
INSERT INTO Electeurs VALUES ('8','Amine','Ahmedi','12/02/1998',2,30,'oui','3');
INSERT INTO Electeurs VALUES ('9','AHMED','Moufid','12/12/1998',4,60,'oui','2');
/*************************QUESTION 1********************************/
CREATE SEQUENCE seq_filiere INCREMENT BY 1 START WITH 1 MAXVALUE 7;
/*************************QUESTION 1********************************/
CREATE SEQUENCE seq_electeur INCREMENT BY 1 START WITH 1 ;
/**************************QUESTION 2*******************************/
CURSOR cr_condidats IS SELECT * FROM Electeurs WHERE cand='oui' ;
/*****************************QUESTION 3****************************/
DECLARE 
id_el Electeurs.idelec%type;
nom_el Electeurs.nom%type;
prenom_el Electeurs.prenom%type;
CURSOR cr_electeur IS SELECT * FROM Electeurs WHERE cand='non' ;
BEGIN
    OPEN cr_electeur;
    LOOP
    FETCH cr_electeur INTO id_el,nom_el,prenom_el;
        EXIT WHEN cr_electeur%notfound;
        dbms_output.put_line(id_el || ' '|| nom_el ||' '||prenom_el);
END LOOP;
    CLOSE cr_electeur;
END;
/***************************QUESTION 4******************************/
DECLARE 
id_fil Filiere.idfil%type;
nom_fil Filiere.nomfil%type;
CURSOR cr_filiere IS SELECT * FROM filiere  ;
BEGIN
    OPEN cr_filiere;
    LOOP
    FETCH cr_filiere INTO id_el,nom_el,prenom_el;
        EXIT WHEN cr_filiere%notfound;
        dbms_output.put_line(id_fil || ' '|| nom_fil );
END LOOP;
    CLOSE cr_filiere;
END;
/************************QUESTION 5*********************************/
DECLARE 
id Electeurs.idelec%type;
nom Electeurs.nom%type;
prenom Electeurs.prenom%type;
CURSOR cr_electeur_candidat IS SELECT * FROM Electeurs  ;
BEGIN
    OPEN cr_electeur_candidat;
    LOOP
    FETCH cr_electeur_candidat INTO id_el,nom_el,prenom_el;
        EXIT WHEN cr_electeur_candidat%notfound;
        dbms_output.put_line(id || ' '|| nom ||' '||prenom);
END LOOP;
    CLOSE cr_electeur_candidat;
END;
/*************************QUESTION 6********************************/
DECLARE
v_nvot Electeurs.nvot%type;
a NUMBER:=0;
b NUMBER:=0;
c NUMBER:=0;
d NUMBER:=0;
e NUMBER:=0;
f NUMBER:=0;
g NUMBER:=0;
TYPE vote_filiere IS TABLE OF Electeurs.nvot%type INDEX BY VARCHAR2(20)   ;
table_nbvote_filiere vote_filiere;
CURSOR cur1 IS SELECT nvot FROM Electeurs WHERE idf='1';
CURSOR cur2 IS SELECT nvot FROM Electeurs WHERE idf='2';
CURSOR cur3 IS SELECT nvot FROM Electeurs WHERE idf='3';
CURSOR cur4 IS SELECT nvot FROM Electeurs WHERE idf='4';
CURSOR cur5 IS SELECT nvot FROM Electeurs WHERE idf='5';
CURSOR cur6 IS SELECT nvot FROM Electeurs WHERE idf='6';
CURSOR cur7 IS SELECT nvot FROM Electeurs WHERE idf='7';
BEGIN
 OPEN cur1;
 
    LOOP
    FETCH cur1 INTO v_nvot ;
        EXIT WHEN cur1%notfound;
        a:=a+v_nvot;
END LOOP;
    CLOSE cur1;
    table_nbvote_filiere('2AP1'):=a;
dbms_output.put_line('LE NOMBRE DE VOTES DE 2AP2 EST  '||table_nbvote_filiere('2AP1'));


   OPEN cur2;
 
    LOOP
    FETCH cur2 INTO v_nvot ;
        EXIT WHEN cur2%notfound;
        b:=b+v_nvot;
END LOOP;
    CLOSE cur2; 
    table_nbvote_filiere('2AP2'):=b;
dbms_output.put_line('LE NOMBRE DE VOTES DE 2AP2 EST  '|| table_nbvote_filiere('2AP2'));

    OPEN cur3;
 
    LOOP
    FETCH cur3 INTO v_nvot ;
        EXIT WHEN cur3%notfound;
        c:=c+v_nvot;
END LOOP;
    CLOSE cur3;
    table_nbvote_filiere('GI'):=c;
dbms_output.put_line('LE NOMBRE DE VOTES DE GI EST  '|| table_nbvote_filiere('GI'));

    OPEN cur4;
 
    LOOP
    FETCH cur4 INTO v_nvot ;
        EXIT WHEN cur4%notfound;
        d:=d+v_nvot;
END LOOP;
    CLOSE cur4;
    table_nbvote_filiere('GSTR'):=d;
dbms_output.put_line('LE NOMBRE DE VOTES DE GSTR EST  '|| table_nbvote_filiere('GSTR'));

    OPEN cur5;
    LOOP
    FETCH cur5 INTO v_nvot ;
        EXIT WHEN cur5%notfound;
        e:=e+v_nvot;
END LOOP;
    CLOSE cur5;
    table_nbvote_filiere('GM'):=e;
dbms_output.put_line('LE NOMBRE DE VOTES DE GM EST  '|| table_nbvote_filiere('GM'));

    OPEN cur6;
 
    LOOP
    FETCH cur6 INTO v_nvot ;
        EXIT WHEN cur6%notfound;
        f:=f+v_nvot;
END LOOP;
    CLOSE cur6;
    OPEN cur7;
    table_nbvote_filiere('GSCM'):=f;
 dbms_output.put_line('LE NOMBRE DE VOTES DE GSCM EST  '|| table_nbvote_filiere('GSCM'));

    LOOP
    FETCH cur7 INTO v_nvot ;
        EXIT WHEN cur7%notfound;
        g:=g+v_nvot;
END LOOP;
    CLOSE cur7;
    table_nbvote_filiere('GC'):=g;
dbms_output.put_line('LE NOMBRE DE VOTES DE GC EST  '|| table_nbvote_filiere('GC'));

END;
/**************************QUESTION 7*******************************/
CURSOR candidat(param Electeurs.idfltype) IS SELECT nom,prenom FROM Electeurs WHERE idf=param AND cand='oui';

/**************************QUESTION 8*******************************/
DECLARE
nbr NUMBER :=0;
CURSOR cur_candidat IS SELECT nom FROM Electeurs WHERE nvoix > 1 AND cand='oui' ;
TYPE table_nvoix IS TABLE OF VARCHAR2(15);
candidat_voix table_nvoix ;
BEGIN
IF cur_candidat%ISOPEN THEN
     CLOSE cur_candidat;
   END IF;
OPEN cur_candidat;
FOR i IN cur_candidat LOOP
nbr:=nbr+1;
candidat_voix.extend;
candidat_voix(nbr):=i.nom;
dbms_output.put_line(candidat_voix(nbr));
END LOOP;
END;

/****************************QUESTION 9*****************************/
CURSOR candidat(param Electeurs.idfl%type) IS SELECT nom,prenom FROM Electeurs WHERE nvote > 1 AND cand='oui';
