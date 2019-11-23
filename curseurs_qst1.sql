/*Curseur permettant d'afficher les infos d'un produit*/
DECLARE
	c_Ref Produit.REF%type;
	c_Libelle Produit.LIBELLE%type;
	c_PU Produit.PU%type;
	c_TVA Produit.TVA%type;
	CURSOR produits is
		SELECT PU,TVA FROM Produit WHERE REF='A01'; 
BEGIN
	OPEN produits;
	LOOP
	FETCH produits into c_PU,c_TVA;
		EXIT WHEN produits%notfound;
		dbms_output.put_line(c_Ref||''||c_Libelle||''||c_PU||''||c_TVA);
	END LOOP;
	CLOSE produits;
END;
 