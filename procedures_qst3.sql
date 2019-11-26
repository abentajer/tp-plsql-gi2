/*une procédure pour permettre à des électeurs de devenir candidat*/
create or replace  PROCEDURE candidat(
	  c_cand IN tab_electeur.CAND%type
)
IS
BEGIN 
	UPDATE tab_electeur SET CAND = '1' ;
END;
