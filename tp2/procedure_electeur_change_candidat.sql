
CREATE OR REPLACE PROCEDURE candidat(
	  e_cand IN Electeurs.cand%type
)
IS
BEGIN 

	UPDATE Electeurs SET e_cand = 1;
END;