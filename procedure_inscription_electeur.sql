/*une procédure pour inscrire les électeurs*/

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