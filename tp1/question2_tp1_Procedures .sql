
CREATE OR REPLACE PROCEDURE add_cmd

	(c_numcommande  IN commande.numcommande%type,
	c_QTE  IN commande.QTE%type,
        c_Prix_HT IN commande.Prix_HT%type,
        c_Prix_TTC  IN commande.Prix_TTC%type,
        c_codeClient  IN commande.codeClient%type,
        c_ref  IN commande.ref%type)
IS		
BEGIN
        INSERT INTO commande(numcommande , QTE ,Prix_HT , Prix_TTC ,  codeClient, ref )
 VALUES
        (c_numcommande,c_QTE,c_Prix_HT,Prix_HT,c_Prix_TTC,c_codeClient,c_ref)
		dbms_output.put_line(c_numcommande ||' '|| c_QTE ||' '|| c_Prix_HT ||' '|| Prix_HT ||' '|| c_Prix_TTC ||' '|| c_codeClient ||' '|| c_ref );
	END add_cmd;
 
/

