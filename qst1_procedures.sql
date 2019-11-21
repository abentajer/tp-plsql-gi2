CREATE OR REPLACE PROCEDURE product
IS
	c_Ref Produit.REF%type;
	c_Libelle Produit.LIBELLE%type;
	c_PU Produit.PU%type;
	c_TVA Produit.TVA%type;	
	CURSOR produits is
		SELECT * FROM Produit ORDER BY PU ASC;		
BEGIN
	OPEN produits;
	LOOP
        FETCH produits into c_Ref,c_Libelle,c_PU,c_TVA;
		EXIT WHEN produits%notfound;
		dbms_output.put_line(''||c_PU||'');
	END LOOP;
	CLOSE produits;
END;