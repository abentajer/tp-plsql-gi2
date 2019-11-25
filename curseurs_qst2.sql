/*Un curseur qui affiche la liste des candidats au BDE*/

DECLARE
	c_id tab_electeur.idelec%type;
	c_cand tab_electeur.cand%type;
	c_nom tab_electeur.nom%type;
	c_prenom tab_electeur.pnom%type;
	CURSOR Candidats is
		SELECT nom,pnom FROM tab_electeur WHERE cand=1;
BEGIN
	OPEN Candidats;
	LOOP
	FETCH Candidats into c_nom,c_prenom;
		EXIT WHEN Candidats%notfound;
		dbms_output.put_line(c_id||''||c_nom||''||c_prenom);
	ENDLOOP;
	CLOSE Candidats;
END;