/*une procédure pour inscrire les électeurs*/
CREATE OR REPLACE PROCEDURE inscrire(
	   c_id IN  tab_electeur.IDELEC%type,
	   c_nom IN  tab_electeur.NOM%type,
	   c_pnom IN  tab_electeur.PNOM%type,
       	   c_ddn IN tab_electeur.DDN%type
)
IS
BEGIN

 	INSERT INTO tab_electeur ("IDELEC", "NOM", "PNOM", "DDN") 
  	VALUES (c_id,c_nom,c_pnom,c_ddn);

END;
