/*Un curseur qui affiche la liste des tous les electeurs*/
DECLARE
	c_id tab_electeur.idelec%type;
	c_nom tab_electeur.nom%type;
	c_prenom tab_electeur.pnom%type;
	CURSOR ListeTElecteurs is
		SELECT nom,pnom FROM tab_electeur;
BEGIN
	OPEN ListeTElecteurs;
	LOOP
	FETCH ListeTElecteurs into c_Lname,c_Fname;
		EXIT WHEN ListeElecteurs%notfound;
		dbms_output.put_line(c_id||''||c_nom||''||c_prenom);
	ENDLOOP;
	CLOSE ListeTElecteurs;
END;