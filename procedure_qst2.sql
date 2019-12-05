SET SERVEROUTPUT ON;

CREATE OR REPLACE PROCEDURE LancerCommande(
	   c_CodeCommande IN COMMANDE.CODE_COMMANDE%TYPE,
       c_MHT IN COMMANDE.MONTANT_HT%TYPE,
       c_MTTC IN COMMANDE.MONTANT_TTC%TYPE,
	   c_DateCommande IN COMMANDE.DATE_COMMANDE%TYPE,
	   c_Reglage IN COMMANDE.REGLAGE%TYPE
	   
	   )
IS
BEGIN

  INSERT INTO commande ("CODE_COMMANDE", "MONTANT_HT", "MONTANT_TTC", "DATE_COMMANDE", "REGLAGE") 
  VALUES (c_CodeCommande,c_MHT,c_MTTC,c_DateCommande, c_Reglage);

  COMMIT;

END;

