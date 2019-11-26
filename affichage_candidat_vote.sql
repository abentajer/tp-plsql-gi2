/*un curseur paramétré permettant d’afficher la liste des candidats ayant voté plus qu’une fois*/


DECLARE
    e_nom Electeurs.nom%type;
    e_pnom Electeurs.pnom%type;
	Cursor ListeCandidatVote is
		SELECT nom,pnom FROM Electeurs
		WHERE cand='1' and nvot>1;
BEGIN
OPEN ListeCandidatVote;
	LOOP
    FETCH ListeCandidatVote INTO e_nom,e_pnom;
    EXIT WHEN ListeCandidatVote%notfound;
		dbms_output.put_line(e_nom||' '||e_pnom);
	END LOOP;
    CLOSE ListeCandidatVote;
END;