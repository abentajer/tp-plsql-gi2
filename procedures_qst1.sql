/*une procédure pour ajouter les filières*/

CREATE OR REPLACE PROCEDURE insertNameFILIERE(
	   f_id IN tab_filiere.IDFIL%type,
	   f_nomfil IN tab_filiere.NOMFIL%type
)
IS
BEGIN
	INSERT INTO tab_filiere ("IDFIL","NOMFIL")
	VALUES (f_id,f_nomfil);
END;
