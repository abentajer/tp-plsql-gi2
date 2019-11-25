/*un curseur paramétré permettant d’afficher la liste des candidats ayant voté plus qu’une fois*/

DECLARE
	e_nom Electeurs.nom%type;
	e_pnom Electeurs.pnom%type;
	Cursor ListeCandidatVote is
		SELECT nom,pnom FROM Electeurs
		WHERE nvot>1 and cand='1';
BEGIN
	OPEN ListeCandidatVote;
	LOOP
	FETCH ListCandidatVote into e_nom,e_pnom;
		EXIT WHEN ListeCandidatVote%notfound;
		dbms_ouput.put_line(e_nom||""||e_pnom);
	END LOOP;
	CLOSE ListCandidatVote;
END;