
DECLARE
v_nom Electeurs.nom%TYPE;
v_pnom Electeurs.pnom%TYPE;
v_ddn Electeurs.ddn%TYPE;
v_idfil Electeurs.idfil%TYPE;

CURSOR C1 IS SELECT nom,pnom,ddn,idfil
FROM Electeurs WHERE INNER JOIN Filiere ON Electeurs.idfil = Filiere.idfil;
BEGIN
	OPEN C1;
	LOOP
		FETCH C1 INTO v_nom, v_pnom, v_ddn, v_idfil;
		EXIT WHEN C3%NOTFOUND;
		dbms_output.put_line('la liste des candidats au BDE est : ' v_nom|| ' ' ||v_pnom || ' ' || v_ddn || ' ' v_idfil) ;
	END LOOP;
	CLOSE C1;
END;
/
