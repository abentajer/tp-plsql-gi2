/*Curseur permettant d'afficher les infos d'un produit*/
DECLARE
	c_Ref PRODUIT.REF%type;
	c_Libelle PRODUIT.Libelle%type;
	c_PU PRODUIT.PU%type;
	c_TVA PRODUIT.TVA%type;
	c_CFamille PRODUIT.Code_famille%type;
	c_CCategorie PRODUIT.Code_categorie%type;
	CURSOR produits is
		SELECT PU,TVA,Libelle FROM Produit WHERE REF='A01'; 
BEGIN
	OPEN produits;
	LOOP
	FETCH produits into c_PU,c_TVA,c_Libelle;
		EXIT WHEN produits%notfound;
		dbms_output.put_line(c_Ref||''||c_Libelle||''||c_PU||''||c_TVA);
	END LOOP;
	CLOSE produits;
END;
 