
DECLARE
v_nom Electeurs.nom%TYPE;
v_pnom Electeurs.pnom%TYPE;
v_ddn Electeurs.ddn%TYPE;
v_idfil Electeurs.idfil%TYPE;

CURSOR C1 IS SELECT nom,pnom,ddn,idfil
FROM Electeurs WHERE nvot >= 1 and nvoix >=1 ;
BEGIN
	OPEN C1;
	LOOP
		FETCH C1 INTO v_nom, v_pnom, v_ddn, v_idfil;
		EXIT WHEN C3%NOTFOUND;

		dbms_output.put_line('la liste des Electeurs est : ' v_nom|| ' ' ||v_pnom || ' ' || v_ddn || ' ' v_idfil) ;

	END LOOP;
	CLOSE C1;
END;
/
