/*une proc�dure pour ajouter les fili�res*/

CREATE OR REPLACE PROCEDURE insertNameFILIERE(
	   f_id IN Filiere.idfil%type,
	   f_nomfil IN Filiere.nomfil%type
)
IS
BEGIN
	INSERT INTO Filiere ("idfil","nomfil")
	VALUES (f_id,f_nomfil);
END;
