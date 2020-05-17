CREATE TABLE filiere
(
  idfil numeric(10) not null,
  nomfil varchar2(50) not null,
  CONSTRAINT supplier_pk PRIMARY KEY (idfil)
);
CREATE TABLE electeurs
( idelec numeric(10) not null,
  nom varchar2(50) not null,
  pnom varchar2(50) not null,
  ddn DATE,
  nvot numeric(10) not null,
  cand varchar2(1) not null,
  idfil numeric(10) not null,
  CONSTRAINT electeurs_pk PRIMARY KEY (idelec),
  CONSTRAINT fk_filiere
    FOREIGN KEY (idfil)
    REFERENCES filiere(idfil)
);
1-
CREATE SEQUENCE supplier_fil
  MINVALUE 1
  MAXVALUE 999999999999999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

CREATE SEQUENCE supplier_elec
  MINVALUE 1
  MAXVALUE 9999999999999999
  START WITH 1
  INCREMENT BY 1
  CACHE 20;

2-
DECLARE 
   c_idelec electeurs.idelec%type; 
   c_nom electeurs.nom%type; 
   CURSOR c_electeurs is 
      SELECT idelec,nom FROM electeurs ; 
BEGIN 
   OPEN c_electeurs; 
   LOOP 
   FETCH c_electeurs into c_idelec, c_nom; 
      EXIT WHEN c_electeurs%notfound; 
      dbms_output.put_line(c_idelec || ' ' || c_nom); 
   END LOOP; 
   CLOSE c_electeurs; 
END; 
/

3-
DECLARE 
   c_idelec electeurs.id%type; 
   c_nom electeurs.nom%type; 
   c_cand electeurs.cand%type; 
   CURSOR c_electeurs is 
      SELECT idelec,nom FROM electeurs where cand='y' ; 
BEGIN 
   OPEN c_electeurs; 
   LOOP 
   FETCH c_electeurs into c_idelec, c_nom, c_cand; 
      EXIT WHEN c_electeurs%notfound; 
      dbms_output.put_line(c_idelec || ' ' || c_nom); 
   END LOOP; 
   CLOSE c_electeurs; 
END; 
/

4-
Filière(#idfil, nomfil)
DECLARE 
   c_idfil filiere.idfil%type; 
   c_nomfil filiere.nomfil%type; 
   CURSOR c_filiere is 
      SELECT idfil,nom FROM filiere ; 
BEGIN 
   OPEN c_filiere; 
   LOOP 
   FETCH c_filiere into c_idfil, c_nomfil; 
      EXIT WHEN c_filiere%notfound; 
      dbms_output.put_line(c_idfil || ' ' || c_nomfil); 
   END LOOP; 
   CLOSE c_filiere; 
END; 
/

5-



6-
DECLARE 
   TYPE vote IS TABLE OF electeurs.nvot%type INDEX BY electeurs.idfil%type; 
   Nbvote vote;
   c_nvot filiere.nvot%type; 
   c_idfil filiere.idfil%type; 
   CURSOR c_vote is 
      SELECT c_nvot,c_idfil FROM filiere GROUP BY c_idfil ; 
BEGIN 
   OPEN c_vote; 
   LOOP 
   FETCH c_vote into c_nvot, c_idfil; 
      EXIT WHEN c_vote%notfound; 
      Nbvote(c_idfil) := c_nvot;
   END LOOP; 
   CLOSE c_filiere; 
END; 
/

7-
DECLARE
    c_nom electeurs.nom%type;
    CURSOR c_nvote(c_idfil electeurs.idfil%type )
    IS
        SELECT c_nom
        FROM electeurs
        WHERE idfil= c_idfil;
BEGIN
OPEN c_nvote('informatique');
    LOOP
        FETCH c_nvote INTO c_nom;
        EXIT WHEN c_nom%notfound;
        dbms_output.put_line(c_idfil || ': ' ||c_nom);
    END LOOP;
    CLOSE c_nvote;
END;
/

8-
CREATE OR REPLACE TYPE list_of_nom
   IS TABLE OF VARCHAR2 (100);
DECLARE
    voix list_of_nom := list_of_nom(); 
    c_nom filiere.nom%type;
    i number :=1;
    CURSOR c_nvoix(n_nvoix electeurs.nvoix%type, )
    IS
        SELECT c_nom
        FROM electeurs
        WHERE nvoix > n_nvoix;
BEGIN
OPEN c_nvoix(10);
    LOOP
        FETCH c_nvoix INTO c_nom;
        EXIT WHEN c_nom%notfound;
        dbms_output.put_line(c_nom);
	voix(i) := c_nom;
	i++;	 
    END LOOP;
    CLOSE c_nvoix;
END;
/

9-
DECLARE
    c_nom filiere.nom%type;
    CURSOR c_nvote(n_nvote electeurs.nvote%type, )
    IS
        SELECT c_nom
        FROM electeurs
        WHERE nvote > n_nvote;
BEGIN
OPEN c_nvote(1);
    LOOP
        FETCH c_nvote INTO c_nom;
        EXIT WHEN c_nom%notfound;
        dbms_output.put_line(c_nom);
    END LOOP;
    CLOSE c_nvote;
END;
/

10-
CREATE OR REPLACE PROCEDURE insertfiliere(
	   p_idfil IN filiere.idfil%TYPE,
	   p_nomfil IN filiere.nomfil%TYPE)
IS
BEGIN

  INSERT INTO filiere ("idfil", "nomfil")
  VALUES (p_idfil, p_nomfil);

  COMMIT;

END;
/

11-
CREATE OR REPLACE PROCEDURE insertelecteur(
	   p_idelec IN electeurs.idelec%TYPE,
	   p_nom IN electeurs.nom%TYPE,
	   p_pnom IN electeurs.pnom%TYPE,
	   p_ddn IN electeurs.ddn%TYPE,
	   p_nvot IN electeurs.nvot%TYPE,	
	   p_nvoix IN electeurs.nvoix%TYPE,
  	   p_cand IN electeurs.cand%TYPE,
	   p_idfl IN electeurs.idfil%TYPE)
IS
BEGIN

  INSERT INTO electeurs("idelec", "nom", "pnom", "ddn", "nvot", "nvoix", "cand", "idfl")
  VALUES (p_idelec ,
	   p_nom ,
	   p_pnom ,
	   p_ddn ,
	   p_nvot ,	
	   p_nvoix ,
  	   p_cand ,
	   p_idfl)

  COMMIT;

END;
/

12-
CREATE OR REPLACE PROCEDURE updatecandidat(
	  p_idelec IN electeurs.idelec%TYPE,	 
  	   p_cand IN electeurs.cand%TYPE:='y')
IS
BEGIN

  UPDATE electeurs SET cand = p_cand where idelec = p_idelec;

  COMMIT;

END;
/

13-14- SE REPETE 

15-
CREATE OR REPLACE PROCEDURE updatevote(
	  p_nvot IN electeurs.nvot%TYPE,	 
  	   p_idelec IN electeurs.idelec%TYPE)
IS
BEGIN

  UPDATE electeurs SET nvot = p_nvot+1 where idelec = p_idelec;

  COMMIT;

END;
/

16-
CREATE OR REPLACE PROCEDURE getTOPthree(
	   p_idelec IN electeurs.idelec%TYPE,
	   p_nvote IN electeurs.nvot%TYPE)
IS
BEGIN

  SELECT idelec , nvot from  electeurs group by idelec order by idelec limit 3;

END;
/

17- SE REPETE

18-
CREATE OR REPLACE PROCEDURE getgagnant(
	   p_idelec IN electeurs.idelec%TYPE,
	   p_nvote IN electeurs.nvot%TYPE
	   p_cand IN electeurs.cand%type:='y')
IS
BEGIN

  SELECT idelec , nvot from  electeurs where cand = p_cand group by idelec order by idelec limit 1;

END;
/

