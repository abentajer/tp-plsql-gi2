/*une proc�dure pour permettre � des �lecteurs de devenir candidat*/

CREATE OR REPLACE PROCEDURE candidat(
	  e_cand IN Electeurs.CAND%type
)
IS
BEGIN 

	UPDATE Electeurs SET CAND = '1';
END;