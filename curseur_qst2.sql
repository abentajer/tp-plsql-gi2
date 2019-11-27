/* Phrase r�sum� : "Le produit ... (R�f�rence:...) a �t� vendu X fois, d une quantit� de Y pi�ces vendues.*/

SET SERVEROUTPUT ON;

DECLARE
	quantite SYSTEM.CMD_CONTENIR.QTE_COMMANDE%TYPE:=0;
	CURSOR phrase_resume IS
		SELECT * FROM SYSTEM.CMD_CONTENIR WHERE SYSTEM.CMD_CONTENIR.REF_PRODUIT='C80';
	ligne phrase_resume%ROWTYPE;
    CURSOR nom_produit IS
        SELECT * FROM SYSTEM.PRODUIT WHERE REF_PRODUIT='C80';
    nom nom_produit%ROWTYPE;
BEGIN
	OPEN phrase_resume;
    OPEN nom_produit;
	LOOP
	FETCH phrase_resume INTO ligne;
    FETCH nom_produit INTO nom;
    	EXIT WHEN phrase_resume%NOTFOUND;
	quantite := quantite+ligne.QTE_COMMANDE;
	END LOOP;
    	DBMS_OUTPUT.PUT_LINE('Le produit '||nom.LIBELLE_PRODUIT||' (R�f�rence: '||ligne.REF_PRODUIT||') a �t� vendu '||phrase_resume%ROWCOUNT||' fois, d une quantit� de '||quantite||' de pi�ces vendues.');
	CLOSE phrase_resume;
    CLOSE nom_produit;
END;

