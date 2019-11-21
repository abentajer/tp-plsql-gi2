/********************************** Fonction MaxClient*************************************/
CREATE OR REPLACE FUNCTION MaxClient
RETURN varchar2 IS 
   total varchar2(100);  
BEGIN 
   
    SELECT c INTO  total FROM ( SELECT SUM(commande.montant_ttc) AS qte , client.nom AS c FROM commande , client
    WHERE commande.code_commande = client.code_commande GROUP BY client.nom)ORDER BY qte desc FETCH NEXT 1 ROWS ONLY;
    RETURN total; 
END;



/********************************** Fonction MinClient*************************************/
CREATE OR REPLACE FUNCTION MaxClient
RETURN varchar2 IS 
   total varchar2(100);  
BEGIN 
   
    SELECT c INTO  total FROM ( SELECT SUM(commande.montant_ttc) AS qte , client.nom AS c FROM commande , client
    WHERE commande.code_commande = client.code_commande GROUP BY client.nom)ORDER BY qte desc FETCH NEXT 1 ROWS ONLY;
    RETURN total; 
END;

