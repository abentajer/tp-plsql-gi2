
CREATE OR REPLACE FUNCTION MinClient
RETURN varchar IS 
   total varchar2(100);  
BEGIN 
   
    SELECT c INTO  total FROM ( SELECT SUM(commande.montant_ttc) AS qte , client.nom AS c FROM commande , client
    WHERE commande.code_commande = client.code_commande GROUP BY client.nom)ORDER BY qte asc FETCH NEXT 1 ROWS ONLY;
    RETURN total; 
END;

set serveroutput on;
DECLARE
 d VARCHAR(100);
BEGIN 
    
   d := MinClient(); 
   dbms_output.put_line('le client qui a passé le Min des achats est  ' || d); 
END;
/
