CREATE OR REPLACE FUNCTION totalcommande (n IN VARCHAR2)
RETURN number IS 
total number(10) := 0;
        BEGIN   
            SELECT count(commande.Montant_TTC) into total FROM commande , client 
            WHERE commande.code_commande = client.code_commande and client.nom=n group by client.nom;
        RETURN total;
END;
/
