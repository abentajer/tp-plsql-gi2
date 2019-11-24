/*Un curseur qui affiche la liste des candidats au BDE*/

DECLARE
	e_nom Electeurs.nom%type;
	e_pnom Electeurs.pnom%type;
	CURSOR Candidats is
		SELECT nom,pnom FROM Electeurs WHERE cand=1; /*si l'électeur est un candidat alors il prend la valeur 1 sinn 0 */
BEGIN
	OPEN Candidats;
	LOOP
	FETCH Candidats into e_nom,e_pnom;
		EXIT WHEN Candidats%notfound;
		dbms_output.put_line(e_nom||''||e_pnom);
	END LOOP;
	CLOSE Candidats;
END;