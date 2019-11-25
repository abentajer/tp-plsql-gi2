/*une procédure pour inscrire les électeurs*/
CREATE OR REPLACE PROCEDURE inscrire(
	   c_id IN  tab_electeur.IDELEC%TYPE,
	   c_nom IN  tab_electeur.NOM%type,
	   c_pnom IN  tab_electeur.PNOM%type,
	   c_ddn IN   tab_electeur.DDN%type,
	   c_nvot IN  tab_electeur.NVOT%type,
	   c_nvoix IN  tab_electeur.NVOIX%type,
	   c_cand IN   tab_electeur.CAND%type,
	   c_idfl IN  tab_electeur.IDFL%type
)
IS
BEGIN

 	INSERT INTO tab_electeur ("IDELEC", "NOM", "PNOM", "DDN") 
  VALUES (c_idelec,c_nom,c_pnom, c_ddn);

END;
