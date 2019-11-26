DECLARE
	Cursor ListCandidatVoix is
		SELECT nom,pnom FROM Electeurs
		WHERE cand=1 and nvoix>10;
	TYPE n_list IS TABLE of Electeurs.nom%type;
	TYPE p_list IS TABLE of Electeurs.pnom%type;
	nom_list n_list;
	pnom_list p_list;
	counter integer:=0; 
BEGIN
	FOR n IN ListCandidatVoix LOOP
		counter:=counter+1;
		nom_list(counter):=n.nom;
		pnom_list(counter):=n.pnom;
		dbms_output.put_line(nom_list(counter)||""||pnom_list(counter));
	END LOOP;
END;