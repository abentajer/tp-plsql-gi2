DECLARE

	e_nom Electeurs.nom%type;
	e_pnom Electeurs.pnom%type;
	CURSOR ListeElecteurs is
		SELECT nom,pnom FROM Electeurs WHERE cand=0;
BEGIN
	OPEN ListeElecteurs;
	LOOP
	FETCH ListeElecteurs into e_nom,e_pnom;
		EXIT WHEN ListeElecteurs%notfound;
		dbms_output.put_line(e_nom||''||e_pnom);
	END LOOP;
	CLOSE ListeElecteurs;
END;