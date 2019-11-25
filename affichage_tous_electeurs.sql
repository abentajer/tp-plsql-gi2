/*Un curseur qui affiche la liste des tous les electeurs*/

DECLARE
	e_nom Electeurs.nom%type;
	e_pnom Electeurs.pnom%type;
	CURSOR ListeAllElecteurs is
		SELECT nom,pnom FROM Electeurs;
BEGIN
	OPEN ListeAllElecteurs;
	LOOP
	FETCH ListeAllElecteurs into e_nom,e_pnom;
		EXIT WHEN ListeAllElecteurs%notfound;
		dbms_output.put_line(e_id||''||e_nom||''||e_pnom);
	END LOOP;
	CLOSE ListeAllElecteurs;
END;