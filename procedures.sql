/***** proc�dure pour ajouter les fili�res*********/
CREATE OR REPLACE PROCEDURE insertNameFILIERE(
	   f_id IN Filiere.idfil%type,
	   f_nomfil IN Filiere.nomfil%type
)
IS
BEGIN
	INSERT INTO Filiere ("idfil","nomfil")
	VALUES (f_id,f_nomfil);
END;

/*****  proc�dure pour inscrire les �lecteurs.*********/
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

/********* proc�dure pour permettre � des �lecteurs de devenir candidat ****/
CREATE OR REPLACE PROCEDURE candidat(
	  e_cand IN Electeurs.cand%type
)
IS
BEGIN 

	UPDATE Electeurs SET e_cand := '1';
END;
