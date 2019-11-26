DECLARE
 c_ref produit.ref%TYPE;
 c_libelleproduit produit.libelleproduit%TYPE;
 c_PU produit.PU%TYPE;
CURSOR c_produit IS 
	SELECT * FROM produit;
BEGIN
	open c_produit;
	LOOP
	FETCH c_produit INTO c_ref,c_libelleproduit,c_pu;
        EXIT WHEN c_produit %notfound;
        dbms_output.put_line(c_ref || ' '|| c_libelleproduit || '  ' || c_PU );
END LOOP;
close c_produit;
end;
/
