CREATE OR REPLACE PROCEDURE be_candidat(
	  v_cand IN Electeurs.cand%TYPE)
IS
BEGIN 

	UPDATE Electeurs SET v_cand = 1;
END;
/
