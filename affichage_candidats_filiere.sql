/*un curseur qui afficher la liste des candidats d’une filière*/


/*Exemple afficher la liste des candidats du filiere GI*/

DECLARE
	e_nom Electeurs.nom%type;
	e_pnom Electeurs.pnom%type;
	Cursor ListeCandidat is
		SELECT nom,pnom From Electeurs
		WHERE Electeurs.idfl = Filiere.idfil and Filiere.nomfil = 'GI' and Electeurs.cand='1';
BEGIN
	OPEN ListeCandidat;
	LOOP
	FETCH ListCanditat into e_nom,e_pnom,f_nomfil;
		EXIT WHEN ListeCandidat%notfound;
		dbms_output.put_line(e_nom||""||e_pnom);
	END LOOP;
	CLOSE ListCandidat;
END;