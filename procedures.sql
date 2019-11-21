/***** procédure pour ajouter les filières*********/
CREATE OR REPLACE PROCEDURE insertNameFILIERE(
	   f_id IN Filiere.idfil%type,
	   f_nomfil IN Filiere.nomfil%type
)
IS
BEGIN
	INSERT INTO Filiere ("idfil","nomfil")
	VALUES (f_id,f_nomfil);
END;

/*****  procédure pour inscrire les électeurs.*********/
CREATE OR REPLACE PROCEDURE inscrire(
	   e_id IN Electeurs.idelec%TYPE,
	   e_nom IN Electeurs.nom%type,
	   e_pnom IN Electeurs.pnom%type,
	   e_ddn IN Electeurs.ddn%type,
	   e_nvot IN Electeurs.nvot%type,
	   e_nvoix IN Electeurs.nvoix%type,
	   e_cand IN Electeurs.cand%type,
	   e_idfl IN Electeurs.idfl%type
)
IS
BEGIN

 	INSERT INTO Electeurs ("idelec", "nom", "pnom", "ddn") 
  VALUES (e_idelec,e_nom,e_pnom, e_ddn);

END;

/********* procédure pour permettre à des électeurs de devenir candidat ****/
CREATE OR REPLACE PROCEDURE candidat(
	  e_cand IN Electeurs.cand%type
)
IS
BEGIN 

	UPDATE Electeurs SET e_cand := '1';
END;
