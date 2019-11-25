/*Un curseur qui affiche la liste des filieres:*/
DECLARE
	f_id tab_filiere.idfil%type;
	f_nom tab_filiere.nomfil%type;
	CURSOR ListeFiliere is
		SELECT idfil,nomfil FROM tab_filiere;
BEGIN
	OPEN ListeFiliere;
	LOOP
	FETCH ListeFiliere into f_id,f_nom;
		EXIT WHEN ListeFiliere%notfound;
		dbms_output.put_line(f_id||''||f_nom);
	ENDLOOP;
	CLOSE ListeFiliere;
END;