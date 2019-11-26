
DECLARE
 c_ref produit.ref%TYPE;
 c_ref commande.ref%TYPE;
 c_codeClient client.codeClient%TYPE;
 c_codeClient commande.codeClient%TYPE;
 c_libelleproduit produit.libelleproduit%TYPE;
 c_dateContact client.dateContact%TYPE;
CURSOR c1 IS 
	SELECT ref , libelleproduit , dateContact
     FROM commande , produit,client
	where dateContact BETWEEN '01/01/2018' AND '31/01/2018';
    
BEGIN
	open c1;
	LOOP
	FETCH c1 INTO c_ref,c_libelleproduit,c_dateContact;
        EXIT WHEN c_produit %notfound;
        dbms_output.put_line(c_ref || ' '|| c_libelleproduit || '  ' ||  'a ete vendu ' ||' '|| 'fois entre la 01/01/2018 et 31/01/2018' );
END LOOP;
close c1;
end;
/
