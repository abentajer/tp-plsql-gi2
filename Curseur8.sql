
DECLARE

CURSOR vote_cursor(vote Electeurs.nvot%TYPE) IS 
SELECT nom,pnom,ddn
FROM Electeurs
WHERE nvot >1;
BEGIN
	FOR  n in vote_cursor
	LOOP 
	dbms_output.put_line('NOM : ' || n.nom || 'Prenom : ' || n.pnom || 'Date de Naissance :' || n.ddn);
	dbms_output.put_line('---------------------------------------------------------------------------');
	END LOOP;

END;
/
