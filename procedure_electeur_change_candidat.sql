/*une procédure pour permettre à des électeurs de devenir candidat*/

CREATE OR REPLACE PROCEDURE candidat(
	  e_cand IN Electeurs.CAND%type
)
IS
BEGIN 

	UPDATE Electeurs SET CAND = '1';
END;