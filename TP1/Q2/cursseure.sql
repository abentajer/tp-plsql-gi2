DECLARE
 	cursor prd(nom_produit catalogue.libelle%TYPE) is
		select *
		from produit
		where libelle = nom_produit;

BEGIN
	
END;