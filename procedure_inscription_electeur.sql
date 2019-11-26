/*une procédure pour inscrire les électeurs*/

CREATE OR REPLACE PROCEDURE inscrire(
	   e_idelec IN  Electeurs.IDELEC%type,
	   e_nom IN  Electeurs.NOM%type,
	   e_pnom IN  Electeurs.PNOM%type,
       	   e_ddn IN Electeurs.DDN%type,
	   e_nvot IN Electeurs.NVOT%type,
	   e_nvoix IN Electeurs.NVOIX%type,
	   e_cand IN Electeurs.CAND%type,
	   e_idfl IN Electeurs.IDFL%type
)
IS
BEGIN

 	INSERT INTO Electeurs ("IDELEC", "NOM", "PNOM", "DDN", "NVOT", "NVOIX", "CAND", "IDFL") 
  	VALUES (e_idelec,e_nom,e_pnom,e_ddn,e_nvot,e_nvoix,e_cand,e_idfl);

END;