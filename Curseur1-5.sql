/*** 1/Les séquences pour les filières et pour les électeurs.**/

CREATE SEQUENCE FILIERE
INCREMENT BY 1
START WITH 1
MAXVALUE 5
MINVALUE 1
NOCYCLE
NOCACHE
ORDER;


CREATE SEQUENCE ELECTEURS
INCREMENT BY 1
START WITH 1
MAXVALUE 2000
NOCYCLE
NOCACHE
ORDER;

/*** 2/Un curseur qui affiche la liste des candidats au BDE:**/

DECLARE
	c_id Electeurs.idelec%type;
	c_cand Electeurs.cand%type;
	c_Lname Electeurs.nom%type;
	c_Fname Electeurs.pnom%type;
	CURSOR Candidats is
		SELECT nom,pnom FROM Electeurs WHERE cand=1;
BEGIN
	OPEN Candidats;
	LOOP
	FETCH Candidats into c_Lname,c_Fname;
		EXIT WHEN Candidats%notfound;
		dbms_output.put_line(c_id||''||c_Lname||''||c_Fname);
	ENDLOOP;
	CLOSE Candidats;
END;

/***3/un curseur qui affiche la liste des electeurs:***/
DECLARE
	c_id Electeurs.idelec%type;
	c_cand Electeurs.cand%type;
	c_Lname Electeurs.nom%type;
	c_Fname Electeurs.pnom%type;
	CURSOR ListeElecteurs is
		SELECT nom,pnom FROM Electeurs WHERE cand=0;
BEGIN
	OPEN ListeElecteurs;
	LOOP
	FETCH ListeElecteurs into c_Lname,c_Fname;
		EXIT WHEN ListeElecteurs%notfound;
		dbms_output.put_line(c_id||''||c_Lname||''||c_Fname);
	ENDLOOP;
	CLOSE ListeElecteurs;
END;
/***4/Un curseur qui affiche la liste des filieres*/

DECLARE
	f_id Filiere.idfil%type;
	f_name Filiere.nomfil%type;
	CURSOR ListeFiliere is
		SELECT idfil,nomfil FROM Filiere;
BEGIN
	OPEN ListeFiliere;
	LOOP
	FETCH ListeFiliere into f_id,f_name;
		EXIT WHEN ListeFiliere%notfound;
		dbms_output.put_line(f_id||''||f_name);
	ENDLOOP;
	CLOSE ListeFiliere;
END;
/**** 5/Un curseur qui affiche la liste des tous les electeurs:**/
DECLARE
	c_id Electeurs.idelec%type;
	c_Lname Electeurs.nom%type;
	c_Fname Electeurs.pnom%type;
	CURSOR ListeTElecteurs is
		SELECT nom,pnom FROM Electeurs;
BEGIN
	OPEN ListeTElecteurs;
	LOOP
	FETCH ListeTElecteurs into c_Lname,c_Fname;
		EXIT WHEN ListeElecteurs%notfound;
		dbms_output.put_line(c_id||''||c_Lname||''||c_Fname);
	ENDLOOP;
	CLOSE ListeTElecteurs;
END;


	
	