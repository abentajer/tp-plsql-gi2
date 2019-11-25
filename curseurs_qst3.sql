/*Un curseur qui affiche la liste des electeurs*/
DECLARE
	c_id tab_electeur.idelec%type;
	c_cand tab_electeur.cand%type;
	c_nom tab_electeur.nom%type;
	c_prenom tab_electeur.pnom%type;
	CURSOR ListeElecteurs is
		SELECT nom,pnom FROM tab_electeur WHERE cand=0;
BEGIN
	OPEN ListeElecteurs;
	LOOP
	FETCH ListeElecteurs into c_nom,c_prenom;
		EXIT WHEN ListeElecteurs%notfound;
		dbms_output.put_line(c_id||''||c_nom||''||c_prenom);
	ENDLOOP;
	CLOSE ListeElecteurs;
END;