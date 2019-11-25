DECLARE

CURSOR cand_cursor(v_idfil INTEGER:=&v_idfil) IS 
SELECT nom,pnom,ddn
FROM Electeurs;
BEGIN
	FOR  n in cand_cursor
	LOOP 
	dbms_output.put_line('NOM : ' || n.nom || 'Prenom : ' || n.pnom || 'Date de Naissance :' || n.ddn);
	dbms_output.put_line('---------------------------------------------------------------------------');
	END LOOP;

END;
/
