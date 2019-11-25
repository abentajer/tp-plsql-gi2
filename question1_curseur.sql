DECLARE
	c_Ref Produit.REF_PRODUIT%type;
	c_Libelle Produit.LIBELLE_PRODUIT%type;
	c_PU Produit.PU%type;
	c_TVA Produit.TVA%type;
	CURSOR afficher_produit is
		SELECT * FROM Produit WHERE REF='B15'; 
BEGIN
	OPEN afficher_produit;
	LOOP
	FETCH afficher_produit into c_Ref,c_PU,c_PU,c_TVA;
		EXIT WHEN afficher_produit%notfound;
		dbms_output.put_line(c_Ref||''||c_Libelle||''||c_PU||''||c_TVA);
	END LOOP;
	CLOSE produits;
END;