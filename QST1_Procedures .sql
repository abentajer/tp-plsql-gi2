
CREATE OR REPLACE PROCEDURE product
IS
	c_ref produit.REF%type;
	c_libelleproduit produit.libelleproduit%type;
	c_PU produit.PU%type;
		
	CURSOR  c2 is
		SELECT * FROM produit ORDER BY PU ASC;		
BEGIN
	OPEN c2;
	LOOP
        FETCH c2 into c_ref,c_libelleproduit,c_PU;
		EXIT WHEN c2%notfound;
		dbms_output.put_line( c_ref ||' '|| c_PU);
	END LOOP;
	CLOSE c2;
END;
/
