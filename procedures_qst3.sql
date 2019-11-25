/*une procédure pour permettre à des électeurs de devenir candidat*/
CREATE OR REPLACE PROCEDURE candidat(
	  c_cand IN tab_electeurCANDcand%type
)
IS
BEGIN 

	UPDATE tab_electeur SET c_cand := '1';
END;
