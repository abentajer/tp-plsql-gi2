
DECLARE

	CURSOR voix_cursor(v_voix Electeurs.nvoix%TYPE) IS 
	SELECT nom,pnom,ddn
	FROM Electeurs
	WHERE nvoix >10; 

	TYPE c_list IS TABLE OF Electeurs.nom%TYPE;
	nom_list c_list := c_list();
	counter integer :=0 ;
BEGIN
	FOR  n in voix_cursor
	LOOP 
		counter:= counter+1;
		nom_list.extend;
		nom_list(counter) := n.nom
	dbms_output.put_line(' Electeurs (' || counter || ') : ' || nom_list(counter));
	dbms_output.put_line('---------------------------------------------------------------------------');
	END LOOP;
END;
/
