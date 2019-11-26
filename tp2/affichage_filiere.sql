
DECLARE
	f_id Filiere.idfil%type;
	f_nom Filiere.nomfil%type;
	CURSOR ListeFiliere is
		SELECT idfil,nomfil FROM Filiere;
BEGIN
	OPEN ListeFiliere;
	LOOP
	FETCH ListeFiliere into f_id,f_nom;
		EXIT WHEN ListeFiliere%notfound;
		dbms_output.put_line(f_id||''||f_nom);
	END LOOP;
	CLOSE ListeFiliere;
END;