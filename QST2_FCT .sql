  
CREATE OR REPLACE FUNCTION MaxClient
RETURN varchar IS 
   total varchar2(100);  
BEGIN 
   
    SELECT c INTO  total FROM ( SELECT SUM(commande.Prix_TTC) AS qte , client.nom AS c FROM commande , client
    WHERE commande.codeClient = client.codeClient GROUP BY client.codeClient)ORDER BY QTE desc FETCH NEXT 1 ROWS ONLY;
    RETURN total; 
END;

/

set serveroutput on;
DECLARE
 c VARCHAR(100);
BEGIN 
    
   c := MaxClient(); 
   dbms_output.put_line('le client qui a passé le max des achats est  ' || c); 
END;
/
