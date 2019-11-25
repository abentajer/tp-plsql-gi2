CREATE OR REPLACE PROCEDURE TrieProduit
IS
	c_Ref Produit.REF_PRODUIT%type;
	c_Libelle Produit.LIBELLE_PRODUIT%type;
	c_PU Produit.PU%type;
	c_TVA Produit.TVA%type;	
	CURSOR Produits is
		SELECT * FROM PRODUIT ORDER BY PU ASC;		
BEGIN
	OPEN Produits;
	LOOP
        FETCH Produits into c_Ref,c_Libelle,c_PU,c_TVA;
		EXIT WHEN Produits%notfound;
		dbms_output.put_line(''||c_PU||'');
	END LOOP;
	CLOSE produits;
END;