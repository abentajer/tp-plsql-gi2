SET SERVEROUTPUT ON;

DECLARE
	CURSOR afficher_produit IS
		SELECT * FROM SYSTEM.PRODUIT WHERE REF_PRODUIT='B15'; 
    ligne afficher_produit%ROWTYPE;
BEGIN
	OPEN afficher_produit;
	LOOP
	FETCH afficher_produit INTO ligne;
		EXIT WHEN afficher_produit%NOTFOUND;
		DBMS_OUTPUT.PUT_LINE(ligne.Ref_PRODUIT||'  '||ligne.LIBELLE_PRODUIT||'  '||ligne.PU||'  '||ligne.PU||'  '||ligne.CODE_FAMILLE||'  '||ligne.CODE_CATEGORIE||'');
	END LOOP;
	CLOSE afficher_produit;
END;